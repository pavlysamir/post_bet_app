import 'package:flutter_windowmanager/flutter_windowmanager.dart';

Future<void> preventScreenshot() async {
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
}
