import 'package:flutter/material.dart';
import 'package:tms/view/splash_screen.dart';

void main() {
  runApp(
      // DevicePreview(
      // enabled: true,
      // tools: const [
      //   ...DevicePreview.defaultTools,
      // ],
      // builder: (BuildContext context) {
      // return
      const MyApp()
      // },
      // )
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
