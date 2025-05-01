import 'package:device_preview/device_preview.dart';
import 'package:flafee/screen/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flafee Coffee',
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}
