import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'display_area.dart';
import 'keyboard_area.dart';
import 'text_data.dart';

void main() {
  Get.put(DisplayController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360.0, 690.0),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => GetMaterialApp(
        title: TextData.appTitle,
        home: Scaffold(
          appBar: AppBar(
            title: const Text(TextData.appTitle),
            titleTextStyle: TextStyle(fontSize: 20.0.sp),
            centerTitle: false,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DisplayArea(),
              const KeyboardArea(),
            ],
          ),
        ),
      ),
    );
  }
}