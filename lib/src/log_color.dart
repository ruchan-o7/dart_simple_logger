// ignore_for_file: constant_identifier_names

enum LogColor {
  Red(colorCode: "[31m"),
  Green(colorCode: "[32m"),
  Yellow(colorCode: "[33m"),
  White(colorCode: "[37m");

  const LogColor({required this.colorCode});
  final String colorCode;
}
