// TODO: Put public facing types in this file.

// ignore_for_file: non_constant_identifier_names

import 'log_color.dart';
import 'logger_options.dart';

class Logger {
  late String prefix;
  late String _buildedPrefix;
  late bool _isDebugEnabled;
  late LogColor _infoColor;
  late LogColor _warningColor;
  late LogColor _errorColor;

  Logger(LoggerOptions options) {
    prefix = options.pChar;
    _isDebugEnabled = options.enableDebug;
    _infoColor = options.infoColor;
    _warningColor = options.warningColor;
    _errorColor = options.errorColor;
    _buildedPrefix = prefix * 25;
  }
  void SetState(bool value) => _isDebugEnabled = value;

  void SetPrefix(String pref) {
    prefix = pref;
    _buildedPrefix = prefix * 25;
  }

  void LogInformation(Object? object) {
    if (_isDebugEnabled) {
      if (_IsList(object)) {
        _logList(object as List);
        return;
      }
      if (_IsMap(object)) {
        _logMap(object as Map);
        return;
      }
      _logWithPrefixAndSuffix(object);
    }
  }

  void LogWarning(String msg) {
    _printSinglePrefix(_warningColor);
    print(_GetWithColor(LogColor.Yellow, msg));
    _printSinglePrefix(_warningColor);
  }

  String _GetWithColor(LogColor color, Object? msg) {
    return "\x1B${color.colorCode} $msg \x1B[0m";
  }

  void LogError(String msg) {
    _printSinglePrefix(_errorColor);
    print(_GetWithColor(LogColor.Red, msg));
    _printSinglePrefix(_errorColor);
  }

  void _logList(List? listObject) {
    if (listObject == null || listObject.isEmpty) {
      _logWithPrefixAndSuffix("List is Empty");
      return;
    }
    _printSinglePrefix(_infoColor);
    for (var i = 0; i < listObject.length; i++) {
      _log(listObject[i], _infoColor);
    }
    _printSinglePrefix(_infoColor);
  }

  void _log(Object? msg, LogColor color) {
    print(_GetWithColor(color, msg));
  }

  void _logWithPrefixAndSuffix(Object? msg, [LogColor color = LogColor.Green]) {
    _printSinglePrefix(color);
    _log(msg, color);
    _printSinglePrefix(color);
  }

  void _printSinglePrefix(LogColor color) {
    print(_GetWithColor(color, _buildedPrefix));
  }

  void _logMap(Map? mapObject) {
    if (mapObject == null || mapObject.isEmpty) {
      _logWithPrefixAndSuffix("Map is Empty");
      return;
    }
    _printSinglePrefix(_infoColor);
    mapObject.forEach((key, value) {
      _log(
          "${_GetWithColor(LogColor.Yellow, "key:")} ${_GetWithColor(_infoColor, key)}, ${_GetWithColor(LogColor.Yellow, "value:")} ${_GetWithColor(LogColor.Green, key)}",
          _infoColor);
    });
    _printSinglePrefix(LogColor.Green);
  }

  bool _IsMap(Object? object) => object is Map;
  bool _IsList(Object? object) => object is List;
}