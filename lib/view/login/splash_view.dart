import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taxi_app/view/login/mobile_number.dart';
// import 'package:taxi_app/view/login/mobile_number_view.dart'; // Update this if needed

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  void _navigateToNext() async {
    // Just a delay to simulate splash, adjust as needed
    await Future.delayed(const Duration(seconds: 2));

    // Then navigate safely
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MobileNumberScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Taxi App Loading...")));
  }
}
