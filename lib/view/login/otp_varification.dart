import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taxi_app/common_widget/commonn_extention.dart';
import 'dart:async';

import 'package:taxi_app/view/login/bank_detail_view.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  final String code;
  final String number;
  
  OTPVerificationScreen({required this.phoneNumber,required this.code, required this.number});

  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  TextEditingController otpController = TextEditingController();
  late Timer _timer;
  int _start = 180; // 3 minutes

  @override
  void initState() {
    super.initState();
    startTimer();
    onSendSms();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  String get formattedTime {
    int minutes = _start ~/ 60;
    int seconds = _start % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    otpController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void verifyOTP() {
    print("Entered OTP: ${otpController.text}");
    // Add your verification logic here
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationId = '';
  String vId = "";
  var code = '';

  onSendSms() async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: "${widget.code} ${widget.number}",
        timeout: const Duration(seconds: 5),
        verificationCompleted: (PhoneAuthCredential credential) async {
          // ANDROID ONLY!

          // Sign the user in (or link) with the auto-generated credential
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (error) {
          mdShowAlert("Fail", error.toString(), () {});
        },
        codeSent: (verificationId, forceResendingToken) {
          vId = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          vId = verificationId;
        },
      );
    } catch (e) {
      mdShowAlert("Fail", e.toString(), () {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.arrow_back),
              SizedBox(height: 24),
              Text(
                'OTP Verification',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Enter the 4-digit code sent to you at',
                style: TextStyle(color: Colors.grey[700]),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    widget.phoneNumber,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // go back to edit
                    },
                    child: Text('Edit'),
                  ),
                ],
              ),
              SizedBox(height: 30),
              PinCodeTextField(
                appContext: context,
                length: 4,
                controller: otpController,
                animationType: AnimationType.fade,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeColor: Colors.green,
                  selectedColor: Colors.green.shade200,
                  inactiveColor: Colors.grey,
                ),
                onChanged: (value) {},
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // ✅ Add OTP validation here if needed
                    if (otpController.text.length == 4) {
                      // Navigate to CreateAccountScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateAccountScreen(),
                        ),
                      );
                    } else {
                      // Optional: Show error if OTP is not 4 digits
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please enter a valid 4-digit OTP'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),

              SizedBox(height: 16),
              Center(
                child: Text(
                  _start > 0
                      ? 'Resend code in $formattedTime'
                      : 'Didn’t receive the code? Resend',
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
