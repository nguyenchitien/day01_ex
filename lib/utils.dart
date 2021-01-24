class Utils {
  static int exchangeC_2_F(int cValue) {
    return (9 / 5 * cValue + 32).floor();
  }

  static int exchangeF_2_C(int fValue) {
    return (5 / 9 * (fValue - 32)).floor();
  }
}
