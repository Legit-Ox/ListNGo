import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listngo/screens/Retailer/register_page_retailers_3.dart';
import 'package:listngo/utilities/customer_textfield.dart';

class RegisterPageRetailers2 extends StatefulWidget {
  const RegisterPageRetailers2({Key? key}) : super(key: key);

  @override
  State<RegisterPageRetailers2> createState() => _RegisterPageRetailers2State();
}

class _RegisterPageRetailers2State extends State<RegisterPageRetailers2> {
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _db = FirebaseFirestore.instance;
  final roles = [
    'Owner',
    'Manager',
    'Others',
  ];
  String? selectedValue1;
  bool isRoleOthers = false;
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
                    controller: _nameController,
                    hintText: 'Name',
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),

                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),

                      // dropdown below..
                      child: DropdownButton<String>(
                        dropdownColor: const Color.fromARGB(255, 161, 161, 161),
                        borderRadius: BorderRadius.circular(10),
                        isExpanded: true,
                        value: selectedValue1,
                        hint: const Text('Role'),
                        onChanged: (newValue) => setState(() {
                          selectedValue1 = newValue!;
                          if (selectedValue1 == 'Others') {
                            isRoleOthers = true;
                          }
                        }),
                        items: roles
                            .map<DropdownMenuItem<String>>((String value) =>
                                DropdownMenuItem<String>(
                                  value: value,
                                  child:
                                      Text(value, style: GoogleFonts.poppins()),
                                ))
                            .toList(),

                        // add extra sugar..
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 42,
                        underline: const SizedBox(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              child: Text(
                                '+91',
                                style: GoogleFonts.poppins(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          flex: 4,
                          child: CustomTextField(
                            hintText: 'Phone Number',
                            controller: _phoneNumberController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              return null;
                            },
                            margin: const EdgeInsets.all(0),
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
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        await _db
                            .collection('Retailer')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .update({
                          'name': _nameController.text.trim(),
                          'role': selectedValue1!.trim(),
                          'phone': _phoneNumberController.text.trim(),
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const RegisterPageRetailers3(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Something went wrong'),
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
