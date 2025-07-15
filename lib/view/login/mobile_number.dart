import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:taxi_app/view/login/otp_varification.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: MobileNumberScreen()),
  );
}

class MobileNumberScreen extends StatefulWidget {
  @override
  _MobileNumberScreenState createState() => _MobileNumberScreenState();
}

class _MobileNumberScreenState extends State<MobileNumberScreen> {
  String selectedCountryCode = '+91';
  TextEditingController phoneController = TextEditingController();

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
                'Enter mobile number',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    CountryCodePicker(
                      onChanged: (country) {
                        setState(() {
                          selectedCountryCode = country.dialCode!;
                        });
                      },
                      initialSelection: 'IN',
                      favorite: ['+91', 'IN'],
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '9876543210',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(Icons.check, color: Colors.green),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text.rich(
                TextSpan(
                  text:
                      'By continuing, I confirm that I have read & agree to the ',
                  children: [
                    TextSpan(
                      text: 'Terms & conditions',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Privacy policy',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                style: TextStyle(fontSize: 13, color: Colors.grey[600]),
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    String fullNumber =
                        '$selectedCountryCode${phoneController.text}';
                    print('Phone: $fullNumber');

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            OTPVerificationScreen(phoneNumber: fullNumber),
                      ),
                    );
                  },
                  child: Text(
                    'CONTINUE',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
