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
import '../../widgets/glass_widgets.dart';
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
      nom: _nameController.text.trim().isEmpty ? 'Veilleur' : _nameController.text.trim(),
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

      await Share.shareXFiles([XFile(file.path)], subject: 'Level Up ! — Sauvegarde');
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erreur export: $e')));
      }
    }
  }

  Future<void> _importData() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json'],
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
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erreur import: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded) {
      _loadSettings();
      return const Center(
        child: CircularProgressIndicator(color: AppColors.accentPurpleLight),
      );
    }

    final runesAsync = ref.watch(runesProvider);
    final isSunday = DateTime.now().weekday == DateTime.sunday;

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 110),
        children: [
          Row(
            children: [
              const Text('⚙️', style: TextStyle(fontSize: 22)),
              const SizedBox(width: 8),
              Text('Paramètres', style: Theme.of(context).textTheme.titleLarge),
            ],
          ),
          const SizedBox(height: 20),

          SectionHeader(title: 'Personnalisation', emoji: '👤'),
          const SizedBox(height: 12),
          GlassCard(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nom du Veilleur',
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 24),

          SectionHeader(title: 'Notifications', emoji: '🔔'),
          const SizedBox(height: 12),
          GlassCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('Activer les rappels'),
                  subtitle: const Text('100% local, aucune donnée envoyée'),
                  value: _notificationsEnabled,
                  onChanged: (v) => setState(() => _notificationsEnabled = v),
                ),
                const Divider(height: 1),
                ListTile(
                  title: const Text('Heure du rappel'),
                  subtitle: Text(_notificationTime.format(context)),
                  trailing: const Icon(Icons.access_time_rounded, color: AppColors.accentPurpleLight),
                  onTap: () async {
                    final picked = await showTimePicker(
                      context: context,
                      initialTime: _notificationTime,
                    );
                    if (picked != null) setState(() => _notificationTime = picked);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          SectionHeader(title: 'Runes de Repos', emoji: '🔮'),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              isSunday ? 'Dimanche — Activez jusqu\'à 2 runes' : 'Les runes ne s\'activent que le dimanche',
              style: AppTheme.metadataStyle,
            ),
          ),
          const SizedBox(height: 12),
          runesAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Text('Erreur: $e'),
            data: (runes) => Column(
              children: runes.map((rune) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: GlassCard(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    accentColor: rune.unlocked ? AppColors.accentCyan : null,
                    child: Row(
                      children: [
                        Text(rune.unlocked ? '⚡' : '🔒', style: const TextStyle(fontSize: 24)),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(rune.name, style: Theme.of(context).textTheme.titleMedium),
                              Text(
                                rune.unlocked
                                    ? rune.description
                                    : 'Débloquée après 7 jours de streak',
                                style: AppTheme.metadataStyle,
                              ),
                            ],
                          ),
                        ),
                        if (rune.unlocked)
                          ElevatedButton(
                            onPressed: isSunday && !rune.active
                                ? () async {
                                    final activated =
                                        await ref.read(runesProvider.notifier).activateRune(rune.id);
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(activated != null
                                              ? '${rune.name} activée !'
                                              : 'Maximum 2 runes actives'),
                                        ),
                                      );
                                    }
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(0, 36),
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                            ),
                            child: Text(rune.active ? 'Active' : 'Activer'),
                          ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 24),

          SectionHeader(title: 'Données', emoji: '💾'),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: _exportData,
            icon: const Icon(Icons.upload_rounded, size: 18),
            label: const Text('Exporter JSON'),
          ),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: _importData,
            icon: const Icon(Icons.download_rounded, size: 18),
            label: const Text('Importer JSON'),
          ),
          const SizedBox(height: 28),

          SizedBox(
            height: 54,
            child: ElevatedButton(
              onPressed: _saveSettings,
              child: const Text('Enregistrer'),
            ),
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
