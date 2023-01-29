import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listngo/constants.dart';
import 'package:listngo/screens/Retailer/add_a_product.dart';
import 'package:listngo/screens/Retailer/retailer_product_detail_screen.dart';
import 'package:listngo/utilities/customer_textfield.dart';
import 'package:listngo/widgets/product_card.dart';

class RetailerAddDetails extends StatefulWidget {
  const RetailerAddDetails({super.key});

  @override
  State<RetailerAddDetails> createState() => _RetailerAddDetailsState();
}

class _RetailerAddDetailsState extends State<RetailerAddDetails> {
  late List<dynamic> products = [];
  late String? getName = "";
  late String? getType = "";
  late String? getArea = "";
  late String? getDesc = "";
  late String? getUrl = "";

  Future<void> _getShopName() async {
    await FirebaseFirestore.instance
        .collection('Retailer')
        .doc((FirebaseAuth.instance.currentUser)!.uid)
        .get()
        .then((value) {
      print(value.data()!['shopName'].toString());
      setState(() {
        getName = value.data()!['shopName'].toString();
      });
    });
  }

  Future<void> _getShopType() async {
    await FirebaseFirestore.instance
        .collection('Retailer')
        .doc((FirebaseAuth.instance.currentUser)!.uid)
        .get()
        .then((value) {
      print(value.data()!['type'].toString());
      setState(() {
        getType = value.data()!['type'].toString().length > 10
            ? "${value.data()!['type'].toString().substring(0, 10)}..."
            : value.data()!['type'].toString();
      });
    });
  }

  Future<void> _getArea() async {
    await FirebaseFirestore.instance
        .collection('Retailer')
        .doc((FirebaseAuth.instance.currentUser)!.uid)
        .get()
        .then((value) {
      print(value.data()!['location'].toString());
      setState(() {
        getArea = value.data()!['location'].toString().length > 10
            ? "${value.data()!['location'].toString().substring(0, 10)}..."
            : value.data()!['location'].toString();
      });
    });
  }

  Future<void> _getDesc() async {
    await FirebaseFirestore.instance
        .collection('Retailer')
        .doc((FirebaseAuth.instance.currentUser)!.uid)
        .get()
        .then((value) {
      print(value.data()!['description'].toString());
      setState(() {
        getDesc = value.data()!['description'].toString().length > 10
            ? "${value.data()!['description'].toString().substring(0, 10)}..."
            : value.data()!['description'].toString();
      });
    });
  }

  Future<void> _getUrl() async {
    await FirebaseFirestore.instance
        .collection('Retailer')
        .doc((FirebaseAuth.instance.currentUser)!.uid)
        .get()
        .then((value) {
      print(value.data()!['shopImage'].toString());
      setState(() {
        getUrl = value.data()!['shopImage'].toString();
      });
    });
  }

  Future<void> setProducts() async {
    await FirebaseFirestore.instance
        .collection('Retailer')
        .doc((FirebaseAuth.instance.currentUser)!.uid)
        .get()
        .then((value) {
      setState(() {
        products = value.data()!['Products'];
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _getUrl();
    _getDesc();
    _getArea();
    _getShopType();
    _getShopName();
    setProducts();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    setProducts();
    super.didChangeDependencies();
  }

  String? productName;
  String? productPrice;
  String? productDesc;
  String? productImgUrl;
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
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 25),
          //   child: Text(
          //     'Shop\'s name',
          //     style: GoogleFonts.poppins(
          //         fontSize: 20, fontWeight: FontWeight.w500),
          //   ),
          // ),
          // SizedBox(
          //   height: size.height * 0.02,
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 25),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: Colors.grey[200],
          //       border: Border.all(color: Colors.white),
          //       borderRadius: BorderRadius.circular(12),
          //     ),
          //     child: Padding(
          //       padding:
          //           const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          //       child: TextField(
          //         minLines: 1,
          //         maxLines: 2,
          //         style: GoogleFonts.poppins(fontSize: 16),

          //         // controller: _phoneNumberController,
          //         decoration: InputDecoration(

          //           border: InputBorder.none,
          //           hintText: '',
          //           hintStyle: GoogleFonts.poppins(),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          CustomTextField(
            initialValue: getName,
            onChanged: (value) async {
              await FirebaseFirestore.instance
                  .collection('Retailer')
                  .doc((FirebaseAuth.instance.currentUser)!.uid)
                  .update({'shopName': value});
            },
            hintText: 'Shop\'s name',
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 25),
          //   child: Text(
          //     'Shop\'s address',
          //     style: GoogleFonts.poppins(
          //         fontSize: 20, fontWeight: FontWeight.w500),
          //   ),
          // ),
          // SizedBox(
          //   height: size.height * 0.02,
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 25),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: Colors.grey[200],
          //       border: Border.all(color: Colors.white),
          //       borderRadius: BorderRadius.circular(12),
          //     ),
          //     child: Padding(
          //       padding:
          //           const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          //       child: TextField(
          //         minLines: 1,
          //         maxLines: 2,
          //         style: GoogleFonts.poppins(fontSize: 16),
          //         // controller: _phoneNumberController,
          //         decoration: InputDecoration(
          //           border: InputBorder.none,
          //           hintText: 'About your shop',
          //           hintStyle: GoogleFonts.poppins(),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

          CustomTextField(
            initialValue: getArea,
            onChanged: (value) async {
              await FirebaseFirestore.instance
                  .collection('Retailer')
                  .doc((FirebaseAuth.instance.currentUser)!.uid)
                  .update({'location': value});
            },
            hintText: 'Shop\'s address',
          ),
          // SizedBox(
          //   height: size.height * 0.02,
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 25),
          //   child: Text(
          //     'Shop\'s area',
          //     style: GoogleFonts.poppins(
          //         fontSize: 20, fontWeight: FontWeight.w500),
          //   ),
          // ),
          SizedBox(
            height: size.height * 0.02,
          ),
          CustomTextField(
            initialValue: getName,
            onChanged: (value) async {
              await FirebaseFirestore.instance
                  .collection('Retailer')
                  .doc((FirebaseAuth.instance.currentUser)!.uid)
                  .update({'type': value});
            },
            hintText: 'Shop\'s type',
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          CustomTextField(
            initialValue: getName,
            onChanged: (value) async {
              await FirebaseFirestore.instance
                  .collection('Retailer')
                  .doc((FirebaseAuth.instance.currentUser)!.uid)
                  .update({'description': value});
            },
            hintText: 'Shop\'s Description',
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 25),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: Colors.grey[200],
          //       border: Border.all(color: Colors.white),
          //       borderRadius: BorderRadius.circular(12),
          //     ),
          //     child: Padding(
          //       padding:
          //           const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          //       child: TextField(
          //         minLines: 1,
          //         maxLines: 2,
          //         style: GoogleFonts.poppins(fontSize: 16),
          //         // controller: _phoneNumberController,
          //         decoration: InputDecoration(
          //           border: InputBorder.none,
          //           hintText: 'About your shop',
          //           hintStyle: GoogleFonts.poppins(),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: size.height * 0.02,
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 25),
          //   child: Text(
          //     'Shop\'s type',
          //     style: GoogleFonts.poppins(
          //         fontSize: 20, fontWeight: FontWeight.w500),
          //   ),
          // ),
          // SizedBox(
          //   height: size.height * 0.02,
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 25),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: Colors.grey[200],
          //       border: Border.all(color: Colors.white),
          //       borderRadius: BorderRadius.circular(12),
          //     ),
          //     child: Padding(
          //       padding:
          //           const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          //       child: TextField(
          //         minLines: 1,
          //         maxLines: 2,
          //         style: GoogleFonts.poppins(fontSize: 16),
          //         // controller: _phoneNumberController,
          //         decoration: InputDecoration(
          //           border: InputBorder.none,
          //           hintText: 'About your shop',
          //           hintStyle: GoogleFonts.poppins(),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
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
                          const Icon(
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
          SizedBox(
            height: size.height * 0.05,
          ),
          Center(
            child: Wrap(
                spacing: 10,
                runSpacing: 20,
                alignment: WrapAlignment.spaceEvenly,
                runAlignment: WrapAlignment.spaceEvenly,
                children: List.generate(
                    products.length,
                    (index) => ProductCard(
                          title: products[index]['name'],
                          image: products[index]['image'],
                          price: products[index]['price'],
                          press: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RetailerDetailScreen(
                                    title: products[index]['name'],
                                    image: products[index]['image'],
                                    price: products[index]['price'],
                                    description: products[index]['description'],
                                  ),
                                ));
                          },
                        ))),
          ),
        ],
      ),
    );
  }
}
