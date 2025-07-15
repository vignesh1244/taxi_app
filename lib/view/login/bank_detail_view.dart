import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:taxi_app/view/login/personal_document.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String selectedCountryCode = '+91';
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.arrow_back),
              SizedBox(height: 24),
              Text(
                'Create Account',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),

              // First Name
              TextField(
                controller: firstNameController,
                decoration: InputDecoration(
                  labelText: 'First name',
                  border: UnderlineInputBorder(),
                ),
              ),

              // Last Name
              TextField(
                controller: lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last name',
                  border: UnderlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // Country Code + Phone Number
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    CountryCodePicker(
                      onChanged: (code) {
                        setState(() {
                          selectedCountryCode = code.dialCode!;
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
                        keyboardType: TextInputType.phone,
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

              // Address
              TextField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: 'Home Address',
                  border: UnderlineInputBorder(),
                ),
              ),

              SizedBox(height: 16),

              // Password
              TextField(
                controller: passwordController,
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: UnderlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Terms & Privacy Notice
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
                style: TextStyle(fontSize: 13, color: Colors.grey[700]),
              ),

              SizedBox(height: 30),

              // Register Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle register logic here
                    final userData = {
                      'firstName': firstNameController.text,
                      'lastName': lastNameController.text,
                      'phone': '$selectedCountryCode${phoneController.text}',
                      'address': addressController.text,
                      'password': passwordController.text,
                    };
                    print('User Registered: $userData');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PersonalDocumentScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'REGISTER',
                    style: TextStyle(color: Colors.white, fontSize: 16),
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
