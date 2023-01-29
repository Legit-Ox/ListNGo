import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listngo/constants.dart';
import 'package:listngo/screens/Customer/product_details_screen.dart';
import 'package:listngo/widgets/product_card.dart';

class ShopDetailScreen extends StatelessWidget {
  ShopDetailScreen({
    Key? key,
    required this.image,
    required this.name,
    required this.type,
    required this.location,
    required this.products,
    required this.description,
  }) : super(key: key);
  final String image, name, type, location, description;
  var products = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Shop Details',
          style: GoogleFonts.poppins(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.01,
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
                          name,
                          style: GoogleFonts.poppins(fontSize: 20),
                          maxLines: 2,
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
                            type,
                            style: GoogleFonts.poppins(
                                fontSize: 12, color: Colors.white),
                          ),
                        ),
                        Container(
                          child: Chip(
                            label: Text(
                              location,
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
                      child: image != null
                          ? Image.network(image)
                          : Image.asset("assets/images/shop1.jfif"),
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
                description,
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
              Center(
                child: Wrap(
                    spacing: 30,
                    runSpacing: 20,
                    alignment: WrapAlignment.spaceEvenly,
                    runAlignment: WrapAlignment.spaceEvenly,
                    children: List.generate(
                        products.length,
                        (index) => ProductCard(
                              name: products[index]['name'],
                              image: products[index]['image'],
                              price: products[index]['price'],
                              description: products[index]['description'],
                              press: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                        name: products[index]['name'],
                                        image: products[index]['image'],
                                        price: products[index]['price'],
                                        description: products[index]
                                            ['description'],
                                      ),
                                    ));
                              },
                            ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);
