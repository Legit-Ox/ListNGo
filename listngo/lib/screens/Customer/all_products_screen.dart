import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listngo/screens/Customer/product_details_screen.dart';
import 'package:listngo/widgets/categories.dart';
import 'package:listngo/widgets/product_card.dart';
import 'package:listngo/widgets/user_drawer.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);
var _scaffoldKey = GlobalKey<ScaffoldState>();

class _AllProductsScreenState extends State<AllProductsScreen> {
  late var Retailers;
  late var AllProducts = [];
  late String? getAddress = "";
  Future<void> setProducts() async {
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('Retailer');

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await collectionRef.get();

    // Get data from docs and convert map to List
    var ProdList = [];
    for (var doc in querySnapshot.docs) {
      var data = doc.data();
      ProdList.add(doc['Products']);
    }

    print(ProdList);
    setState(() {
      AllProducts = ProdList;
    });
    // print(allData);
  }

  Future<void> _getFutureAddress() async {
    FirebaseFirestore.instance
        .collection('Customer')
        .doc((FirebaseAuth.instance.currentUser)!.uid)
        .get()
        .then((value) {
      print(value.data()!['address'][2].toString());
      setState(() {
        getAddress = value.data()!['address'][2].toString().length > 10
            ? "${value.data()!['address'][2].toString().substring(0, 10)}..."
            : value.data()!['address'][2].toString();
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _getFutureAddress();
    setProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: const drawerWidget(),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            icon: SvgPicture.asset(
              "assets/icons/menu.svg",
              color: Colors.black,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.black,
              ),
              const SizedBox(width: 10),
              Text(
                getAddress!,
                style: GoogleFonts.poppins(color: Colors.black),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Text(
                  "Products",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 24),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(4, 4),
                      )
                    ],
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                // padding: const EdgeInsets.symmetric(vertical: 10),
                child: Form(
                  child: TextFormField(
                    onSaved: (value) {},
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      hintText: "Search items...",
                      border: OutlineInputBorder(
                          gapPadding: 0, borderRadius: BorderRadius.zero),
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
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              const Categories(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Center(
                child: Wrap(
                    spacing: 30,
                    runSpacing: 20,
                    alignment: WrapAlignment.spaceEvenly,
                    runAlignment: WrapAlignment.spaceEvenly,
                    children: List.generate(
                        AllProducts.length,
                        (index) => ProductCard(
                              name: AllProducts[index][0]['name'],
                              image: AllProducts[index][0]['image'],
                              price: AllProducts[index][0]['price'],
                              description: AllProducts[index][0]['description'],
                              press: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                        name: AllProducts[index][0]['name'],
                                        image: AllProducts[index][0]['image'],
                                        price: AllProducts[index][0]['price'],
                                        description: AllProducts[0][index]
                                            ['description'],
                                      ),
                                    ));
                              },
                            ))),
              ),
            ],
          ),
        ));
  }
}
