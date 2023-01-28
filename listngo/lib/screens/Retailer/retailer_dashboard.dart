import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listngo/constants.dart';

class RetailerDashboard extends StatefulWidget {
  const RetailerDashboard({super.key});

  @override
  State<RetailerDashboard> createState() => _RetailerDashboardState();
}

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);

class _RetailerDashboardState extends State<RetailerDashboard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.01,
            ),
            Center(
              child: Form(
                child: TextFormField(
                  onSaved: (value) {},
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF8F9F8),
                    hintText: "Search items...",
                    border: OutlineInputBorder(),
                    enabledBorder: outlineInputBorder,
                    focusedBorder: outlineInputBorder,
                    errorBorder: outlineInputBorder,
                    prefixIcon: Padding(
                        padding: EdgeInsets.all(14),
                        child: Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 95, 95, 95),
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jitendra Stores',
                        style: GoogleFonts.poppins(fontSize: 20),
                      ),
                      SizedBox(
                        height: size.height * 0.005,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: primaryGreen,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "General",
                          style: GoogleFonts.poppins(
                              fontSize: 12, color: Colors.white),
                        ),
                      ),
                      Container(
                        child: Chip(
                          label: Text(
                            "Shahibaug",
                            style: GoogleFonts.poppins(
                                fontSize: 12, color: Colors.white),
                          ),
                          avatar: const Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.blue,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('assets/images/shop1.jfif'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 225, 225, 225),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                'Jitendra Stores, 3rd floor, Shubh Complex, Shahibaug, Ahmedabad,380004',
                style: GoogleFonts.poppins(fontSize: 16),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              'About',
              style: GoogleFonts.poppins(
                  fontSize: 18, color: const Color.fromARGB(255, 90, 90, 90)),
            ),
            const Divider(
              thickness: 2,
              color: Color.fromARGB(255, 146, 146, 146),
            ),
            Text(
              'We sell everything from notebooks to ice-creams. Visit us at the given address.',
              style: GoogleFonts.poppins(fontSize: 16),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              'Products',
              style: GoogleFonts.poppins(
                  fontSize: 20, color: const Color.fromARGB(255, 90, 90, 90)),
            ),
            const Divider(
              thickness: 2,
              color: Color.fromARGB(255, 146, 146, 146),
            ),
          ],
        ),
      ),
    );
  }
}
