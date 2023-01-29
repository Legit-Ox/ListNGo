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
  late String? getName;
  late String? getType;
  late String? getArea;
  late String? getDesc;
  late String? getUrl;

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
          CustomTextField(
            initialValue: getName,
            onChanged: (value) {
              setState(() {
                getName = value;
              });
            },
            hintText: 'Shop\'s name',
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          CustomTextField(
            initialValue: getArea,
            onChanged: (value) {
              setState(() {
                getArea = value;
              });
            },
            hintText: 'Shop\'s address',
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          CustomTextField(
            initialValue: getType,
            onChanged: (value) {
              setState(() {
                getType = value;
              });
            },
            hintText: 'Shop\'s type',
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          CustomTextField(
            initialValue: getDesc,
            onChanged: (value) {
              setState(() {
                getDesc = value;
              });
            },
            hintText: 'Shop\'s Description',
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          GestureDetector(
            onTap: () async {
              await FirebaseFirestore.instance
                  .collection('Retailer')
                  .doc((FirebaseAuth.instance.currentUser)!.uid)
                  .update({
                'shopName': getName,
                'type': getType,
                'location': getArea,
                'description': getDesc
              });
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
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            child: Text(
                              'Done',
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
            height: size.height * 0.02,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AddAProduct()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: primaryPurple, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.add,
                            color: primaryPurple,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            child: Text(
                              'Add product',
                              style: GoogleFonts.poppins(
                                  fontSize: 18, color: primaryPurple),
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
                          name: products[index]['name'],
                          image: products[index]['image'],
                          price: products[index]['price'],
                          description: products[index]['description'],
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
