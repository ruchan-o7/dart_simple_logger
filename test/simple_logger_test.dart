import 'package:simple_logger/simple_logger.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests,', () {
    // final awesome = Awesome();
    late Logger logger;
    setUp(() {
      logger = LoggerBuilder.CreateBuilder()
          .SetEnabled(true)
          .SetPrefix("*")
          .Create();
    });
    test("Prefix Should Start (*)", () => {expect(logger.prefix, "*")});
    test("Prefix Should Start (//)", () {
      logger.SetPrefix("//");
      expect(logger.prefix, "//");
    });
    test("Info Test", () {
      logger.LogInformation("Info");
    });
    test("Warning Test", () {
      logger.LogWarning("Warning");
    });
    test("Error Test", () {
      logger.LogError("Error");
    });
  });
}
