import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:tms/view/auth%20screens/welcome_screen.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    tools: const [
      ...DevicePreview.defaultTools,
    ],
    builder: (BuildContext context) {
      return const MyApp();
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //     appBarTheme: const AppBarTheme(
      //   titleTextStyle: TextStyle(color: white),
      //   backgroundColor: primary_color,
      // )),
      home: WelcomeScreen(),
    );
  }
}
