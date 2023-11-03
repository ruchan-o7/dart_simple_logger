import 'package:simple_logger/simple_logger.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests,', () {
    setUp(() {
      LoggerBuilder.CreateBuilder()
          .SetEnabled(true)
          .SetPrefix("*")
          .Create();
    });
    test("Prefix Should Start (*)", () => {expect(Logger.prefix, "*")});
    test("Prefix Should Start (//)", () {
      Logger.SetPrefix("//");
      expect(Logger.prefix, "//");
    });
    test("Info Test", () {
      Logger.LogInformation("Info");
    });
    test("Warning Test", () {
      Logger.LogWarning("Warning");
    });
    test("Error Test", () {
      Logger.LogError("Error");
    });
  });
}
