import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listngo/constants.dart';
import 'package:listngo/screens/Retailer/retailer_product_detail_screen.dart';
import 'package:listngo/widgets/product_card.dart';

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
  late List<dynamic> products = [];
  late String? getName = "";
  late String? getType = "";
  late String? getArea = "";
  late String? getDesc = "";
  late String? getUrl = "";
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

  @override
  void initState() {
    // TODO: implement initState
    setProducts();
    _getUrl();
    _getDesc();
    _getArea();
    _getShopType();
    _getShopName();

    super.initState();
  }

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
                        getName.toString(),
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
                          getType.toString(),
                          style: GoogleFonts.poppins(
                              fontSize: 12, color: Colors.white),
                        ),
                      ),
                      Container(
                        child: Chip(
                          label: Text(
                            getArea.toString(),
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
                    child: Image.network(getUrl.toString()),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              'About',
              style: GoogleFonts.poppins(
                  fontSize: 16, color: const Color.fromARGB(255, 0, 0, 0)),
            ),
            const Divider(
              thickness: 2,
              color: Color.fromARGB(255, 146, 146, 146),
            ),
            Text(
              getDesc.toString(),
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
    );
  }
}
