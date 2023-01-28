import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listngo/constants.dart';
import 'package:listngo/models/Product.dart';
import 'package:listngo/screens/Customer/product_details_screen.dart';
import 'package:listngo/screens/Retailer/add_a_product.dart';
import 'package:listngo/widgets/product_card.dart';


class RetailerAddDetails extends StatefulWidget {
  const RetailerAddDetails({super.key});

  @override
  State<RetailerAddDetails> createState() => _RetailerAddDetailsState();
}

class _RetailerAddDetailsState extends State<RetailerAddDetails> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Shop\'s name',
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  minLines: 1,
                  maxLines: 2,
                  style: GoogleFonts.poppins(fontSize: 16),
                  // controller: _phoneNumberController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'About your shop',
                    hintStyle: GoogleFonts.poppins(),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Shop\'s address',
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  minLines: 1,
                  maxLines: 2,
                  style: GoogleFonts.poppins(fontSize: 16),
                  // controller: _phoneNumberController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'About your shop',
                    hintStyle: GoogleFonts.poppins(),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Shop\'s area',
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  minLines: 1,
                  maxLines: 2,
                  style: GoogleFonts.poppins(fontSize: 16),
                  // controller: _phoneNumberController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'About your shop',
                    hintStyle: GoogleFonts.poppins(),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Shop\'s type',
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  minLines: 1,
                  maxLines: 2,
                  style: GoogleFonts.poppins(fontSize: 16),
                  // controller: _phoneNumberController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'About your shop',
                    hintStyle: GoogleFonts.poppins(),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddAProduct(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: primaryGreen, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: primaryGreen,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            child: Text(
                              'Add product',
                              style: GoogleFonts.poppins(
                                  fontSize: 18, color: primaryGreen),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Wrap(
                spacing: 10,
                runSpacing: 20,
                alignment: WrapAlignment.spaceEvenly,
                runAlignment: WrapAlignment.spaceEvenly,
                children: List.generate(
                    demo_product.length,
                    (index) => ProductCard(
                          title: demo_product[index].title,
                          image: demo_product[index].image,
                          price: demo_product[index].price,
                          bgColor: demo_product[index].bgColor,
                          press: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                      product: demo_product[index]),
                                ));
                          },
                        ))),
          ),
        ],
      ),
    );
  }
}
