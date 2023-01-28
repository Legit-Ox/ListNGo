import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listngo/screens/Customer/register_page_customers_1.dart';
import 'package:listngo/screens/Retailer/register_page_retailers_1.dart';

class ChooseRoleScreen extends StatefulWidget {
  const ChooseRoleScreen({super.key});

  @override
  State<ChooseRoleScreen> createState() => _ChooseRoleScreenState();
}

class _ChooseRoleScreenState extends State<ChooseRoleScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: size.width * 0.05,
                  ),
                  // margin: EdgeInsets.symmetric(
                  //   horizontal: size.width * 0.05,
                  //   vertical: size.width * 0.05,
                  // ),
                  // alignment: Alignment.center,
                  child: Text(
                    'Choose your role',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: size.width * 0.05,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: size.width * 0.05,
                  ),
                  // alignment: Alignment.center,
                  child: Text(
                    'Are you here to buy or sell, please select the corresponding option, make your account and start your journey with ListNgo',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: const Color.fromARGB(255, 131, 131, 131),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterPageCustomers1(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                  vertical: size.width * 0.05,
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: size.width * 0.1,
                  vertical: size.width * 0.1,
                ),

                // margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 136, 239, 255),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Customer',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            'Are you here to buy and explore all the products on sale in your neighbourhood?',
                            style: GoogleFonts.poppins(
                                fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    endIndent: size.width * 0.05,
                    indent: size.width * 0.05,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'or',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.black,
                    letterSpacing: 2,
                  ),
                ),
                Expanded(
                  child: Divider(
                    endIndent: size.width * 0.05,
                    indent: size.width * 0.05,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterPageRetailers1(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                  vertical: size.width * 0.05,
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: size.width * 0.1,
                  vertical: size.width * 0.1,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 142, 136, 255),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Retailer',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            'Are you here to sell and expand your business?\n',
                            style: GoogleFonts.poppins(
                                fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
