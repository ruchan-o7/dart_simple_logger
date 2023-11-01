import 'package:simple_logger/src/logger_builder.dart';

void main() {
  var logger = LoggerBuilder.CreateBuilder().SetEnabled(true).SetPrefix("/\\").Create();
  logger.LogInformation("Information");
  logger.LogWarning("Warnings");
  logger.LogError("Some Erros");
}
