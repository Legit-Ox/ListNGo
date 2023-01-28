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

import '../../utilities/Location.dart';

class CustomerDashboardScreen extends StatefulWidget {
  const CustomerDashboardScreen({super.key});

  @override
  State<CustomerDashboardScreen> createState() =>
      _CustomerDashboardScreenState();
}

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);

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
      print(value.data()!['address'][0].toString());
      setState(() {
        getAddress = value.data()!['address'][0].toString().length > 12
            ? "${value.data()!['address'][0].toString().substring(0, 12)}..."
            : value.data()!['address'][0].toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 234, 234, 234),
        leading: IconButton(
          onPressed: () {},
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
              overflow: TextOverflow.ellipsis,
              softWrap: true,
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
            onPressed: () {
              AuthServices.signOut(context);
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Discover",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Flexible(
                    flex: 5,
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
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(14),
                            backgroundColor: primaryGreen,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                          ),
                          onPressed: () {
                            getCurrentLocation(context)
                                .then((value) => print("Updated Address"));
                          },
                          child: const Center(child: Icon(Icons.dashboard))),
                    ),
                  ),
                ],
              ),
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


