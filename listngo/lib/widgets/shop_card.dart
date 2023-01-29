import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listngo/constants.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({
    Key? key,
    required this.image,
    required this.name,
    required this.type,
    required this.location,
    required this.press,
  }) : super(key: key);
  final String image, name, type, location;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        // height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: secondaryPurpleTint.withOpacity(0.3),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12)),
                        child: image != null
                            ? Image.network(
                                image,
                                fit: BoxFit.cover,
                              )
                            : Image.asset("assets/images/shop1.jfif")),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16 / 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      name,
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  // const SizedBox(width: 16 / 4),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: primaryGreen,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      type,
                      style: GoogleFonts.poppins(
                          fontSize: 12, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerRight,
              child: Chip(
                label: Text(
                  location,
                  style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),
                ),
                avatar: const Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                ),
                backgroundColor: Colors.blue,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
