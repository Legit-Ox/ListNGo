import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listngo/screens/Customer/customer_dashboard.dart';
import 'package:listngo/utilities/customer_textfield.dart';

class RegisterPageCustomers2 extends StatefulWidget {
  const RegisterPageCustomers2({Key? key}) : super(key: key);

  @override
  State<RegisterPageCustomers2> createState() => _RegisterPageCustomers2State();
}

class _RegisterPageCustomers2State extends State<RegisterPageCustomers2> {
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;
  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      'Enter your details',
                      style: GoogleFonts.poppins(
                          fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      'Please enter your details to successfully make an account',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  CustomTextField(
                    hintText: 'Name',
                    controller: _nameController,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 20),
                              child: Text(
                                '+91',
                                maxLines: 1,
                                style: GoogleFonts.poppins(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          flex: 5,
                          child: CustomTextField(
                            hintText: 'Phone Number',
                            margin: const EdgeInsets.all(0),
                            controller: _phoneNumberController,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  GestureDetector(
                    //Function for Sign Up to be written in this onTap
                    onTap: () {
                      _db.collection('Customer').doc(user!.uid).update({
                        'name': _nameController.text.trim(),
                        'phone': _phoneNumberController.text.trim(),
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CustomerDashboardScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF6C63FF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
