import 'package:flutter/material.dart';
import 'package:taxi_app/common/color_extention.dart';
import 'package:taxi_app/view/login/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taxi Driver',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        fontFamily: "NunitoSans",
        scaffoldBackgroundColor: TColor.bg,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SplashView(),
      // builder: EasyLoading.init(),
    );
  }
}
