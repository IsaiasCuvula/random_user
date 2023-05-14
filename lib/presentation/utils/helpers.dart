class Helpers {
  static double stringToDouble(String value) {
    try {
      return double.parse(value);
    } catch (e) {
      return 13.249;
    }
  }
}
