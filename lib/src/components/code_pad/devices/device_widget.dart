import 'package:flutter/material.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/scheduler.dart';

class DeviceWidget extends StatefulWidget {
  final Widget child;

  DeviceWidget(this.child);

  @override
  _DeviceWidgetState createState() => _DeviceWidgetState();
}

class _DeviceWidgetState extends State<DeviceWidget> {
  bool isDark = true;
  bool hasShadow = true;
  bool isKeyboard = false;
  bool isEnabled = true;
  late DeviceFrameStyle style;

  @override
  void initState() {
    super.initState();
    style = isDark ? DeviceFrameStyle.dark() : DeviceFrameStyle.light();
  }

  final GlobalKey screenKey = GlobalKey();
  List<DeviceInfo> allDevices = [
    ...Devices.ios.all,
    ...Devices.android.all,
    ...Devices.macos.all,
    ...Devices.windows.all,
    ...Devices.linux.all,
  ];
  Orientation orientation = Orientation.portrait;

  @override
  Widget build(BuildContext context) {

    return DeviceFrameTheme(
      style: style,
      child: DefaultTabController(
        length: allDevices.length,
        child: Scaffold(
          backgroundColor: isDark ? Colors.white : Colors.black,
          appBar: AppBar(
            title: Text('Devices'),
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  setState(() {
                    hasShadow = !hasShadow;
                  });
                },
                icon: Icon(Icons.settings_brightness),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isDark = !isDark;
                  });
                },
                icon: Icon(Icons.brightness_medium),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    orientation = orientation == Orientation.landscape
                        ? Orientation.portrait
                        : Orientation.landscape;
                  });
                },
                icon: Icon(Icons.rotate_90_degrees_ccw),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isKeyboard = !isKeyboard;
                  });
                },
                icon: Icon(Icons.keyboard),
              ),
              /*IconButton(
                  onPressed: () {
                    setState(() {
                      isEnabled = !isEnabled;
                    });
                  },
                  icon: Icon(Icons.check),
                ),*/
            ],
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                ...allDevices
                    .map((x) => Tab(text: '${x.identifier.type} ${x.name}')),
              ],
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Builder(
                builder: (context) => !isEnabled
                    ? widget.child
                    : AnimatedBuilder(
                        animation: DefaultTabController.of(context)!,
                        builder: (context, _) => _frame(
                            allDevices[DefaultTabController.of(context)!.index],
                            hasShadow,
                            orientation,
                            isKeyboard,
                            widget.child),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _frame(DeviceInfo device, hasShadow, orientation, isKeyboard, child) =>
    Center(
      child: DeviceFrame(
        device: device,
        isFrameVisible: hasShadow,
        orientation: orientation,
        screen: Container(
          color: Colors.white,
          child: VirtualKeyboard(
            isEnabled: isKeyboard,
            child: child,
          ),
        ),
      ),
    );
