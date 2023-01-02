import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telemedicine_app/screen/home_screen.dart';
import 'package:telemedicine_app/screen/schedule_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: ()=>SchedulePage())
      ],
    );
  }
}
