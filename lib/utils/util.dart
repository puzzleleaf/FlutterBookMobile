class Util {
  static int hexToColor(String colorString) {
    return int.parse(colorString.replaceFirst('#', 'ff'), radix: 16);
  }
}