import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:taxi_app/view/home/home_view.dart';
// import 'package:taxi_app/view/login/personal_document.dart';

class AddVehicle extends StatefulWidget {
  @override
  _AddVehicleState createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController vehicleModelController = TextEditingController();
  final TextEditingController vehicleNumberController = TextEditingController();
  final TextEditingController vehicleColorController = TextEditingController();
  final TextEditingController seatCountController = TextEditingController();

  String selectedCountryCode = '+91';
  String selectedVehicleType = 'Sedan';
  bool obscurePassword = true;

  final List<String> vehicleTypes = ['Sedan', 'Hatchback', 'SUV', 'Mini Van'];

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

              // Phone with country code
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

              SizedBox(height: 30),

              /// ---------------------- VEHICLE DETAILS SECTION ----------------------
              Text(
                'Vehicle Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),

              // Vehicle Type Dropdown
              DropdownButtonFormField<String>(
                value: selectedVehicleType,
                items: vehicleTypes.map((type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedVehicleType = value!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Vehicle Type',
                  border: UnderlineInputBorder(),
                ),
              ),

              // Vehicle Model
              TextField(
                controller: vehicleModelController,
                decoration: InputDecoration(
                  labelText: 'Vehicle Model',
                  border: UnderlineInputBorder(),
                ),
              ),

              // Vehicle Number
              TextField(
                controller: vehicleNumberController,
                decoration: InputDecoration(
                  labelText: 'Vehicle Number',
                  border: UnderlineInputBorder(),
                ),
              ),

              // Vehicle Color
              TextField(
                controller: vehicleColorController,
                decoration: InputDecoration(
                  labelText: 'Vehicle Color',
                  border: UnderlineInputBorder(),
                ),
              ),

              // Number of Seats
              TextField(
                controller: seatCountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Number of Seats',
                  border: UnderlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),

              // Terms
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
                    final userData = {
                      'firstName': firstNameController.text,
                      'lastName': lastNameController.text,
                      'phone': '$selectedCountryCode${phoneController.text}',
                      'address': addressController.text,
                      'password': passwordController.text,
                      'vehicleType': selectedVehicleType,
                      'vehicleModel': vehicleModelController.text,
                      'vehicleNumber': vehicleNumberController.text,
                      'vehicleColor': vehicleColorController.text,
                      'seats': seatCountController.text,
                    };

                    print('User Registered: $userData');

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeView()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      HomeView();
                    },
                    child: Text("register"),
                  ),
                  // child: Text(
                  //   'REGISTER',
                  //   style: TextStyle(color: Colors.white, fontSize: 16),
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
