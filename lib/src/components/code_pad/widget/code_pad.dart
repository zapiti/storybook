import 'package:flutter/material.dart';

import '../devices/device_widget.dart';
import '../source/source_code_view.dart';
import '../style/syntax_highlighter.dart';

class CodePad extends StatefulWidget {
  final String sourceStoryFilePath;
  final Widget child;

  final SyntaxHighlighterStyle? syntaxHighlighterStyle;

  const CodePad({
    Key? key,
    required this.child,
    required this.sourceStoryFilePath,
    this.syntaxHighlighterStyle,
  }) : super(key: key);

  static const _TABS = <Widget>[
    Tab(
      icon: Icon(Icons.dashboard, color: Colors.white),
      text: 'Preview',
    ),
    Tab(
      icon: Icon(Icons.code, color: Colors.white),
      text: 'Code',
    ),
    Tab(
      icon: Icon(Icons.devices_other, color: Colors.white),
      text: 'Devices',
    ),
  ];

  @override
  _CodePadState createState() => _CodePadState();
}

class _CodePadState extends State<CodePad> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  String get routeName => '/${this.runtimeType.toString()}';

  Widget get sourceCodeView => SourceCodeView(
        filePath: this.widget.sourceStoryFilePath,
        syntaxHighlighterStyle: widget.syntaxHighlighterStyle ??
            SyntaxHighlighterStyle.darkThemeStyle().copyWith(
              commentStyle: TextStyle(color: Colors.yellow),
              keywordStyle: TextStyle(color: Colors.lightGreen),
              classStyle: TextStyle(color: Colors.amber),
              numberStyle: TextStyle(color: Colors.orange),
            ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _ColoredTabBar(
        color: Theme.of(context).primaryColor,
        tabBar: TabBar(
          controller: _tabController,
          tabs: CodePad._TABS,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          _AlwaysAliveWidget(child: this.widget.child),
          _AlwaysAliveWidget(child: this.sourceCodeView),
          _AlwaysAliveWidget(child: DeviceWidget(this.widget.child)),
        ],
      ),
    );
  }
}

// This widget is always kept alive, so that when tab is switched back, its
// child's state is still preserved.
class _AlwaysAliveWidget extends StatefulWidget {
  final Widget child;

  const _AlwaysAliveWidget({Key? key, required this.child}) : super(key: key);

  @override
  _AlwaysAliveWidgetState createState() => _AlwaysAliveWidgetState();
}

class _AlwaysAliveWidgetState extends State<_AlwaysAliveWidget>
    with AutomaticKeepAliveClientMixin<_AlwaysAliveWidget> {
  @override
  Widget build(BuildContext context) {
    super.build(context); // This build method is annotated "@mustCallSuper".
    return this.widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}

class _ColoredTabBar extends Container implements PreferredSizeWidget {
  final Color color;
  final TabBar tabBar;

  _ColoredTabBar({Key? key, required this.color, required this.tabBar})
      : super(key: key);

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) => Material(
        elevation: 4.0,
        color: color,
        child: tabBar,
      );
}
