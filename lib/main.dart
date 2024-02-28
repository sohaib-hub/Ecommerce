//import 'package:firebase_core/firebase_core.dart';
import 'package:ecommerce/resources/appcolors/app_colors.dart';
import 'package:ecommerce/view/auth_view/auth_view.dart';
import 'package:ecommerce/view/homeview/homeviw.dart';
import 'package:ecommerce/view/main_view/main_view.dart';
import 'package:ecommerce/view/splash_view/splash_view.dart';
import 'package:ecommerce/view/welcome_view/welcome_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(Appcolors.primary),
          fillColor: MaterialStateProperty.all(Appcolors.primary),
          overlayColor: MaterialStateProperty.all(Appcolors.primary),
          splashRadius: 0,
        ),
        fontFamily: "IBM Plex Sans",
        inputDecorationTheme: InputDecorationTheme(
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
                style: BorderStyle.solid, color: Colors.redAccent),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
                style: BorderStyle.solid, color: Colors.black87),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
                style: BorderStyle.solid, color: Colors.black87),
          ),
          labelStyle: TextStyle(color: Appcolors.primary),
          iconColor: Appcolors.black900,
          hintStyle: TextStyle(color: Appcolors.primary.withAlpha(99)),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
                style: BorderStyle.solid, color: Colors.redAccent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
                style: BorderStyle.solid, color: Colors.black87),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
                style: BorderStyle.solid, color: Colors.black87),
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF202020),
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          iconTheme: IconThemeData(color: Colors.black),
          toolbarTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        colorScheme: ThemeData()
            .colorScheme
            .copyWith(primary: Appcolors.primary, secondary: Appcolors.secondary),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Appcolors.primary,
        dialogTheme: const DialogTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
        ),
      ),
      //
      //
      home: SplashView(),
   // home: HomeView(),

      // initialRoute: AppRoutes.initialfRoute,
      // getPages: AppRoutes.pages,
    );
  }
}

