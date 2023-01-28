import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:listngo/screens/Customer/login_page_customers.dart';
import 'package:listngo/screens/Customer/register_page_customers_2.dart';
import 'package:listngo/utilities/Validators.dart';
import 'package:listngo/utilities/customer_textfield.dart';

import '../../functions/authFunctions.dart';

class RegisterPageCustomers1 extends StatefulWidget {
  const RegisterPageCustomers1({Key? key}) : super(key: key);

  @override
  State<RegisterPageCustomers1> createState() => _RegisterPageCustomers1State();
}

class _RegisterPageCustomers1State extends State<RegisterPageCustomers1> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  bool passwordVisible = true;
  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
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
                  Container(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      'assets/images/login.svg',
                      fit: BoxFit.contain,
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.07, 0, 0, 0),
                    child: Text(
                      'Create your account',
                      style: GoogleFonts.poppins(
                          fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.07, 0, 0, 0),
                    child: Text(
                      'You are signing up as a customer',
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
                    onChanged: () {},
                    hintText: 'Email',
                    validator: isEmailValid,
                    controller: _emailController,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  CustomTextField(
                    hintText: 'Password',
                    validator: isPasswordValid,
                    controller: _passwordController,
                    obscureText: passwordVisible,
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(
                          () {
                            passwordVisible = !passwordVisible;
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  GestureDetector(
                    //Function for Sign Up to be written in this onTap
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        await AuthServices.signupUser(
                                'Customer',
                                _emailController.text.trim(),
                                _passwordController.text.trim(),
                                context)
                            .then((value) async {
                          if (value == "Success") {
                            // await _db
                            //     .collection('Customers')
                            //     .doc(FirebaseAuth.instance.currentUser!.uid)
                            //     .set({
                            //   'Name': FirebaseAuth
                            //       .instance.currentUser!.displayName,
                            //   'Email': FirebaseAuth.instance.currentUser!.email,
                            //   'Phone Number': FirebaseAuth
                            //       .instance.currentUser!.phoneNumber,
                            //   'Address': '',
                            //   'City': '',
                            //   'State': '',
                            //   'Pincode': '',
                            //   'Profile Picture':
                            //       FirebaseAuth.instance.currentUser!.photoURL,
                            // });
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const RegisterPageCustomers2();
                                },
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Something went wrong'),
                              ),
                            );
                          }
                        });
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) =>
                        //         const RegisterPageCustomers2(),
                        //   ),
                        // );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill all the fields'),
                          ),
                        );
                      }
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
                            'Next',
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
                  Center(
                    child: Text(
                      'or, register with email.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: const Color.fromARGB(128, 0, 0, 0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: GestureDetector(
                      onTap: () async {
                        await AuthServices.signInwithGoogle('Customer')
                            .then((value) async {
                          if (value == "Success") {
                            // await _db
                            //     .collection('Customers')
                            //     .doc(FirebaseAuth.instance.currentUser!.uid)
                            //     .set({
                            //   'Name': FirebaseAuth
                            //       .instance.currentUser!.displayName,
                            //   'Email': FirebaseAuth.instance.currentUser!.email,
                            //   'Phone Number': FirebaseAuth
                            //       .instance.currentUser!.phoneNumber,
                            //   'Address': '',
                            //   'City': '',
                            //   'State': '',
                            //   'Pincode': '',
                            //   'Profile Picture':
                            //       FirebaseAuth.instance.currentUser!.photoURL,
                            // });
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const RegisterPageCustomers2();
                                },
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Something went wrong'),
                              ),
                            );
                          }
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Sign Up With ',
                                style: GoogleFonts.poppins(
                                    letterSpacing: 2,
                                    wordSpacing: 3,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                              SvgPicture.asset(
                                'assets/images/google.svg',
                                height: 35,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already a member? ',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const LoginPageCustomers(),
                              ));
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.poppins(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
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
