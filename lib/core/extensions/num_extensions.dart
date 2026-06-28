extension NumExtensions on num {
  double clampProgress(double min, double max) {
    return toDouble().clamp(min, max).toDouble();
  }

  String toProgressString() => '${toStringAsFixed(1)}%';
}
