import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'app/core/routes/app_pages.dart';
import 'app/core/utils/colors.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primarySwatch: funBlueColorMaterial,
        appBarTheme: const AppBarTheme(
          brightness: Brightness.light,
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: funBlueColor)
        )
      ),
    ),
  );
}
