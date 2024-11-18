class NumeroUtils {
  static double tratarValoresDouble(dynamic value) {
    if (value == null) {
      return 0.0;
    }

    if (value is int) {
      return value.toDouble();
    }
    return value as double;
  }
}