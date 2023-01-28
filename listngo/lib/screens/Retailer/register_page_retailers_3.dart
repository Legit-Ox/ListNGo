import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listngo/screens/Retailer/add_products_screen.dart';
import 'package:listngo/utilities/customer_textfield.dart';

class RegisterPageRetailers3 extends StatefulWidget {
  const RegisterPageRetailers3({Key? key}) : super(key: key);

  @override
  State<RegisterPageRetailers3> createState() => _RegisterPageRetailers3State();
}

class _RegisterPageRetailers3State extends State<RegisterPageRetailers3> {
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final roles = [
    'Stationary',
    'General Stores',
    'Medicine',
    'Grocery Stores',
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    'Tell us about your shop',
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
                    'Please enter your details to list your shop on the app and make it visible to every user',
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
                  hintText: 'Shop Name',
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

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
                      hint: const Text('Type'),
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
                const CustomTextField(
                  hintText: 'GST ID (Optional)',
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                const CustomTextField(
                  prefixIcon: Icon(
                    Icons.location_on_outlined,
                    color: Color.fromARGB(255, 57, 57, 57),
                  ),
                  hintText: 'Location',
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
                        builder: (context) => const AddProducts(),
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
    );
  }
}
