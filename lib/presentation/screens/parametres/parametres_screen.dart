import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/services/notification_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../providers/mur_notifier.dart';
import '../../providers/providers.dart';
import '../../providers/streak_notifier.dart';
import '../historique/historique_screen.dart';

class ParametresScreen extends ConsumerStatefulWidget {
  const ParametresScreen({super.key});

  @override
  ConsumerState<ParametresScreen> createState() => _ParametresScreenState();
}

class _ParametresScreenState extends ConsumerState<ParametresScreen> {
  final _nameController = TextEditingController();
  TimeOfDay _notificationTime = const TimeOfDay(hour: 8, minute: 0);
  bool _notificationsEnabled = false;
  bool _loaded = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _loadSettings() async {
    final murState = await ref.read(murStateProvider.future);
    if (!mounted) return;
    setState(() {
      _nameController.text = murState.veilleur.nom;
      _notificationTime = TimeOfDay(
        hour: murState.veilleur.notificationHour,
        minute: murState.veilleur.notificationMinute,
      );
      _notificationsEnabled = murState.veilleur.notificationsEnabled;
      _loaded = true;
    });
  }

  Future<void> _saveSettings() async {
    final murState = await ref.read(murStateProvider.future);
    final updated = murState.veilleur.copyWith(
      nom: _nameController.text.trim().isEmpty
          ? 'Veilleur'
          : _nameController.text.trim(),
      notificationHour: _notificationTime.hour,
      notificationMinute: _notificationTime.minute,
      notificationsEnabled: _notificationsEnabled,
    );

    await ref.read(veilleurRepositoryProvider).saveVeilleur(updated);
    await NotificationService.instance.scheduleDailyReminder(
      hour: _notificationTime.hour,
      minute: _notificationTime.minute,
      enabled: _notificationsEnabled,
    );
    await ref.read(murStateProvider.notifier).refresh();

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Paramètres enregistrés')),
      );
    }
  }

  Future<void> _exportData() async {
    try {
      final json = await ref.read(dataExportRepositoryProvider).exportToJson();
      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/level_up_backup.json');
      await file.writeAsString(json);

      await Share.shareXFiles(
        [XFile(file.path)],
        subject: 'Level Up ! — Sauvegarde',
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur export: $e')),
        );
      }
    }
  }

  Future<void> _importData() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: true,
        allowedExtensions: ['pdf'],
        
      );
      if (result == null || result.files.single.path == null) return;

      final content = await File(result.files.single.path!).readAsString();
      await ref.read(dataExportRepositoryProvider).importFromJson(content);

      ref.invalidate(historiqueProvider);
      await ref.read(murStateProvider.notifier).refresh();
      await ref.read(runesProvider.notifier).refresh();
      await _loadSettings();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Données importées avec succès')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur import: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded) {
      _loadSettings();
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final runesAsync = ref.watch(runesProvider);
    final isSunday = DateTime.now().weekday == DateTime.sunday;

    return Scaffold(
      appBar: AppBar(title: const Text('Paramètres')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Personnalisation', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Nom du Veilleur'),
          ),
          const SizedBox(height: 24),
          Text('Notifications offline', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          SwitchListTile(
            title: const Text('Activer les rappels'),
            subtitle: const Text('100% local, aucune donnée envoyée'),
            value: _notificationsEnabled,
            activeColor: AppColors.accentFire,
            onChanged: (v) => setState(() => _notificationsEnabled = v),
          ),
          ListTile(
            title: const Text('Heure du rappel'),
            subtitle: Text(_notificationTime.format(context)),
            trailing: const Icon(Icons.access_time),
            onTap: () async {
              final picked = await showTimePicker(
                context: context,
                initialTime: _notificationTime,
              );
              if (picked != null) {
                setState(() => _notificationTime = picked);
              }
            },
          ),
          const SizedBox(height: 24),
          Text('Runes de Repos', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(
            isSunday
                ? 'Dimanche — Activez jusqu\'à 2 runes'
                : 'Les runes ne s\'activent que le dimanche',
            style: AppTheme.metadataStyle,
          ),
          const SizedBox(height: 12),
          runesAsync.when(
            loading: () => const CircularProgressIndicator(),
            error: (e, _) => Text('Erreur: $e'),
            data: (runes) => Column(
              children: runes.map((rune) {
                return Card(
                  child: ListTile(
                    leading: Text(
                      rune.unlocked ? '⚡' : '🔒',
                      style: const TextStyle(fontSize: 24),
                    ),
                    title: Text(rune.name),
                    subtitle: Text(
                      rune.unlocked
                          ? rune.description
                          : 'Débloquée après 7 jours de streak',
                    ),
                    trailing: rune.unlocked
                        ? ElevatedButton(
                            onPressed: isSunday && !rune.active
                                ? () async {
                                    final activated = await ref
                                        .read(runesProvider.notifier)
                                        .activateRune(rune.id);
                                    if (mounted) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            activated != null
                                                ? '${rune.name} activée !'
                                                : 'Maximum 2 runes actives',
                                          ),
                                        ),
                                      );
                                    }
                                  }
                                : null,
                            child: Text(rune.active ? 'Active' : 'Activer'),
                          )
                        : null,
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 24),
          Text('Données', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: _exportData,
            icon: const Icon(Icons.upload),
            label: const Text('Exporter JSON'),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: _importData,
            icon: const Icon(Icons.download),
            label: const Text('Importer JSON'),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: _saveSettings,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 52),
            ),
            child: const Text('Enregistrer'),
          ),
          const SizedBox(height: 16),
          Text(
            'Level Up ! — 100% offline • Aucun tracking • Vie privée totale',
            style: AppTheme.metadataStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
