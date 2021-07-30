import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../style/syntax_highlighter.dart';

class SourceCodeView extends StatefulWidget {
  final String filePath;

  final SyntaxHighlighterStyle? syntaxHighlighterStyle;

  const SourceCodeView({
    Key? key,
    required this.filePath,
    this.syntaxHighlighterStyle,
  }) : super(key: key);

  @override
  _SourceCodeViewState createState() {
    return _SourceCodeViewState();
  }
}

class _SourceCodeViewState extends State<SourceCodeView> {
  double _textScaleFactor = 1.0;

  Widget _getCodeView(String codeContent, BuildContext context) {
    codeContent = codeContent.replaceAll('\r\n', '\n');
    final SyntaxHighlighterStyle style = widget.syntaxHighlighterStyle ??
        (Theme.of(context).brightness == Brightness.dark
            ? SyntaxHighlighterStyle.darkThemeStyle()
            : SyntaxHighlighterStyle.lightThemeStyle());
    return  Container(

      constraints: BoxConstraints.expand(),
      child: Scrollbar(
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SelectableText.rich(
              TextSpan(
                style: GoogleFonts.droidSansMono(fontSize: 12)
                    .apply(fontSizeFactor: this._textScaleFactor),
                children: <TextSpan>[
                  DartSyntaxHighlighter(style).format(codeContent)
                ],
              ),
              style: DefaultTextStyle.of(context)
                  .style
                  .apply(fontSizeFactor: this._textScaleFactor),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(data: ThemeData.dark(), child:FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(widget.filePath),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.all(4.0),
              child: _getCodeView(snapshot.data!, context),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.content_copy),
              onPressed: () async {
                Clipboard.setData(ClipboardData(
                    text: await DefaultAssetBundle.of(context)
                        .loadString(widget.filePath)));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Code copied!'),
                ));
              },
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}
