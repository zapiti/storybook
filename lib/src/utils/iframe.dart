import '../utils/value_or.dart';
import '../../storybook.dart';

String iframeSrc(Map<String, String> options) {
  var prefix = 'embed-${valueOr(options, 'mode', 'dart')}.html';
  var theme = 'theme=${valueOr(options, 'theme', 'light')}';
  var run = 'run=${valueOr(options, 'run', 'false')}';
  var split = 'split=${valueOr(options, 'split', 'false')}';
  var analytics = 'ga_id=${valueOr(options, 'ga_id', 'false')}';

  return '$iframePrefix$prefix?$theme&$run&$split&$analytics';
}
