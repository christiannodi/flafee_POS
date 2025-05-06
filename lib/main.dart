import 'package:device_preview/device_preview.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';

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
    return GetMaterialApp(
      title: 'Flafee Coffee',
      initialRoute:
          AppPages.initial, // Menentukan route pertama kali yang akan dipanggil
      getPages: AppPages.routes,
      // Menambahkan semua route yang sudah dideklarasikan
    );
  }
}
