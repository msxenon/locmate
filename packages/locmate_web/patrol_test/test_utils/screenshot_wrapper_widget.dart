import 'package:flutter/widgets.dart';
import 'package:screenshot/screenshot.dart';

class ScreenshotWrapperWidget extends StatefulWidget {
  final Widget child;
  const ScreenshotWrapperWidget({super.key, required this.child});

  @override
  State<ScreenshotWrapperWidget> createState() =>
      ScreenshotWrapperWidgetState();
}

class ScreenshotWrapperWidgetState extends State<ScreenshotWrapperWidget> {
  final screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Screenshot(controller: screenshotController, child: widget.child);
  }
}
