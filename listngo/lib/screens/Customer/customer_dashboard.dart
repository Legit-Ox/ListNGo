import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listngo/constants.dart';
import 'package:listngo/functions/authFunctions.dart';
import 'package:listngo/widgets/categories.dart';
import 'package:listngo/widgets/products_list.dart';
import 'package:listngo/widgets/shops_list.dart';
import 'package:listngo/widgets/user_drawer.dart';

import '../../utilities/Location.dart';

class CustomerDashboardScreen extends StatefulWidget {
  const CustomerDashboardScreen({super.key});

  @override
  State<CustomerDashboardScreen> createState() =>
      _CustomerDashboardScreenState();
}

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10)),
  borderSide: BorderSide.none,
);

var _scaffoldKey = GlobalKey<ScaffoldState>();

class _CustomerDashboardScreenState extends State<CustomerDashboardScreen> {
  final user = FirebaseAuth.instance.currentUser;
  late String? getAddress = "";

  @override
  void initState() {
    getCurrentLocation(context);
    _getFutureAddress();
    super.initState();
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
              getAddress.toString(),
              overflow: TextOverflow.clip,
              softWrap: true,
              style: GoogleFonts.poppins(
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {
              AuthServices.signOut(context);
            },
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
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
              child: Text(
                "Discover",
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
            const ProductsList(),
            const ShopList(),
          ],
        ),
      ),
    );
  }
}

// Future<String> getStreet() async {
//   return await getFutureAddress();
// }


