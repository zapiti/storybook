class DartPadInjectException implements Exception {
  final String message;

  DartPadInjectException(this.message);

  @override
  String toString() => '$message';
}

class LanguageStringParser {
  final String input;
  final RegExp _validExp = RegExp(r'[a-z-]*run-dartpad(:?[a-z-]*)+');
  final RegExp _optionsExp = RegExp(r':([a-z_]*)-([a-z0-9%_]*)');

  LanguageStringParser(this.input);

  bool get isValid {
    return _validExp.hasMatch(input);
  }

  Map<String, String> get options {
    var opts = <String, String>{};
    if (!isValid) {
      return opts;
    }

    var matches = _optionsExp.allMatches(input);
    for (var match in matches) {
      if (match.groupCount != 2) {
        continue;
      }
      opts[match[1]!] = match[2]!;
    }

    return opts;
  }
}
