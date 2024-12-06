import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ussed_manager/app/modules/splash/views/splash_view.dart';
import 'package:ussed_manager/app/routes/app_pages.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
          home: SplashView(),
        );
      },
    );
  }
}
