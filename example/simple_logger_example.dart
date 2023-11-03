import 'package:simple_logger/simple_logger.dart';

void main() {
  LoggerBuilder.CreateBuilder().SetEnabled(true).SetPrefix("/\\").Create();
  Logger.LogInformation("Information");
  Logger.LogWarning("Warnings");
  Logger.LogError("Some Erros");
}
