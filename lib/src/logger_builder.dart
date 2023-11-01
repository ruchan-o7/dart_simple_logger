// ignore_for_file: non_constant_identifier_names

import '../simple_logger.dart';

class LoggerBuilder implements ILoggerBuilder {
  LoggerBuilder._() {
    options = LoggerOptions();
  }
  late LoggerOptions options;

  static LoggerBuilder CreateBuilder() {
    return LoggerBuilder._();
  }

  @override
  LoggerBuilder SetPrefix(String pChar) {
    assert(pChar != "");
    options.pChar = pChar;
    return this;
  }

  @override
  LoggerBuilder SetEnabled(bool value) {
    options.enableDebug = value;
    return this;
  }

  @override
  LoggerBuilder SetInfoColor(LogColor color) {
    options.infoColor = color;
    return this;
  }

  @override
  LoggerBuilder SetWarningColor(LogColor color) {
    options.warningColor = color;
    return this;
  }

  @override
  LoggerBuilder SetErrorColor(LogColor color) {
    options.errorColor = color;
    return this;
  }

  @override
  Logger Create() {
    return Logger(options);
  }
}

abstract class ILoggerBuilder {
  ILoggerBuilder();
  ILoggerBuilder SetPrefix(String pChar);
  ILoggerBuilder SetEnabled(bool value);
  ILoggerBuilder SetInfoColor(LogColor color);
  ILoggerBuilder SetWarningColor(LogColor color);
  ILoggerBuilder SetErrorColor(LogColor color);
  Logger Create();
}
