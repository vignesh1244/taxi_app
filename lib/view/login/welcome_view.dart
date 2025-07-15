import 'package:flutter/material.dart';
import 'package:taxi_app/common_widget/round_button.dart';
import 'package:taxi_app/view/login/mobile_number.dart';
import 'package:taxi_app/view/login/personal_document.dart';
// import 'package:taxi_app/view/login/splash_view.dart';
// import 'package:flutter/services.dart';
// import 'package:taxi_app/view/login/change_language_view.dart';

import '../../common/color_extention.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // 🔽 Put background image first, so it's behind everything
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/welcome_bg.png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.1),
                  BlendMode.dstATop,
                ),
              ),
            ),
          ),

          // 🔼 Foreground content comes after
          SafeArea(
            child: Column(
              children: [
                SizedBox(
                  width: context.width * 0.25,
                  child: Image.asset(
                    "assets/img/app_logo.png",
                    fit: BoxFit.cover,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: RoundButton(
                    title: "Sign In",
                    onPressed: () {
                      context.push(PersonalDocumentScreen());
                      print("Button pressed!");
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: RoundButton(
                    title: "SIGN UP",
                    onPressed: () {
                      context.push(MobileNumberScreen());
                    },
                  ),
                ),
                SizedBox(
                  height: context.height * 0.02,
                ), // typo fixed: 0.02 not 02
              ],
            ),
          ),
        ],
      ),
    );
  }
}
