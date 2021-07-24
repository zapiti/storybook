

import 'dart_pad_injection.dart';

Map<String, String> parseFiles(String snippet) {
  return _InjectParser(snippet).read();
}

class _InjectParser {
  final String input;
  final RegExp _beginExp = RegExp(r'{\$ begin ([a-z.]*) \$}');
  final RegExp _endExp = RegExp(r'{\$ end ([a-z.]*) \$}');
  final Map<String, String> _tokens = {};

  _InjectParser(this.input);

  /// Returns filenames and contents that were parsed from the input
  Map<String, String> read() {
    var lines = input.split('\n');
    for (var i = 0; i < lines.length; i++) {
      _readLine(i, lines[i]);
    }

    if (_tokens.isEmpty) {
      return {'main.dart': input.trim()};
    }

    return _tokens;
  }

  void _readLine(int currentLine, String line) {
    String? _currentFile;
    if (_beginExp.hasMatch(line)) {
      if (_currentFile == null) {
        _currentFile = _beginExp.firstMatch(line)?[1];
      } else {
        _error(currentLine, 'unexpected begin');
      }
    } else if (_endExp.hasMatch(line)) {
      if (_currentFile == null) {
        _error(currentLine, 'unexpected end');
      } else {
        var match = _endExp.firstMatch(line)?[1];
        if (match != _currentFile) {
          _error(currentLine, 'end statement did not match begin statement');
        } else {
          // add newline
          _addLine('', _currentFile);
          _currentFile = null;
        }
      }
    } else if (_currentFile != null) {
      _addLine(line, _currentFile);
    }
  }

  void _addLine(String line, String file) {
    if (_tokens[file] == null) {
      _tokens[file] = line;
    } else {
      _tokens[file] = _tokens[file]! + '\n$line';
    }
  }

  void _error(int currentLine, String message) {
    var errorMessage =
        'error parsing DartPad scripts on line $currentLine: $message';
    throw DartPadInjectException(errorMessage);
  }
}
