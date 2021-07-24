library dart_pad;

import 'dart:html' as html;
import 'dart:ui' as ui;
import 'package:html_unescape/html_unescape.dart';
import 'package:flutter/material.dart';
import '../../utils/code_gen.dart';
import '../../utils/iframe.dart';
import '../../utils/inject_parser.dart';

var iframePrefix = 'https://dartpad.dev/';


class DartPad extends StatefulWidget {
  final double width;
  final double height;
  final bool darkMode;
  final bool flutter;
  final bool runImmediately;
  final String stringCode;
  final List<String>? listImport;
  final bool split;
  final ThemeData? themeData;

  DartPad(
      {required Key key,
      this.width = 600,
      this.height = 500,
      this.darkMode = true,
      this.flutter = false,
      this.runImmediately = false,
      this.listImport,
      this.split = false,
        required this.stringCode,
      this.themeData,})
      : super(key: key);

  @override
  _DartPadState createState() => _DartPadState();
}

class _DartPadState extends State<DartPad> {
  Map<String, String> get options => {
        'mode': widget.flutter ? 'flutter' : 'dart',
        'theme': widget.darkMode ? 'dark' : 'light',
        'run': widget.runImmediately ? 'true' : 'false',
        'split': widget.split ? 'true' : 'false',
        'ga_id': widget.key.toString(),
      };

  late html.IFrameElement iframe = html.IFrameElement()
    ..attributes = {'src': iframeSrc(options)};

  @override
  void initState() {
    super.initState();

    iframe.style.width = widget.width.toInt().toString();
    iframe.style.height = widget.height.toInt().toString();
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry
        .registerViewFactory('dartpad${widget.key}', (int viewId) => iframe);
    html.window.addEventListener('message', (dynamic e) {
      if (e.data['type'] == 'ready') {
        var m = {
          'sourceCode': parseFiles(HtmlUnescape().convert(codeGen(
              stringCode: widget.stringCode,
              listImport: widget.listImport ?? [],))),
          'type': 'sourceCode'
        };
        iframe.contentWindow!.postMessage(m, '*');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: HtmlElementView(viewType: 'dartpad${widget.key}'),
    );
  }
}
