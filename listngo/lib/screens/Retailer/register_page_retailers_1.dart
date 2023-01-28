import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listngo/functions/authFunctions.dart';
import 'package:listngo/screens/Retailer/login_page_retailers.dart';
import 'package:listngo/screens/Retailer/register_page_retailers_2.dart';
import 'package:listngo/utilities/Validators.dart';
import 'package:listngo/utilities/customer_textfield.dart';

class RegisterPageRetailers1 extends StatefulWidget {
  const RegisterPageRetailers1({Key? key}) : super(key: key);

  @override
  State<RegisterPageRetailers1> createState() => _RegisterPageRetailers1State();
}

class _RegisterPageRetailers1State extends State<RegisterPageRetailers1> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  bool passwordVisible = true;

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
                      'assets/images/register_customers.svg',
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
                      'You are signing up as a retailer',
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
                  const CustomTextField(
                    hintText: 'Email',
                    validator: isEmailValid,
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPageRetailers2(),
                        ),
                      );
                      AuthServices.signupUser(
                        'Retailer',
                        _emailController.text.trim(),
                        _passwordController.text.trim(),
                        context,
                      ).then((value) {
                        print(value);
                        if (value == 'Success') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const RegisterPageRetailers2(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(value),
                            ),
                          );
                        }
                      });
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
                            'Submit',
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
                      'or',
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
                      onTap: (() {
                        // AuthServices.signInwithGoogle().whenComplete(() {
                        //   Navigator.of(context).push(
                        //     MaterialPageRoute(
                        //       builder: (context) {
                        //         return const RegisterPageRetailers2();
                        //       },
                        //     ),
                        //   );
                        // });
                      }),
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
                                    const LoginPageRetailers(),
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
