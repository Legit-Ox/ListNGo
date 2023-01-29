import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listngo/constants.dart';
import 'package:listngo/functions/authFunctions.dart';
import 'package:listngo/screens/Retailer/retailer_add_details.dart';
import 'package:listngo/screens/Retailer/retailer_dashboard.dart';
import 'package:listngo/screens/Retailer/retailer_stats.dart';

class RetailerMainPage extends StatefulWidget {
  const RetailerMainPage({Key? key}) : super(key: key);

  @override
  _RetailerMainPageState createState() => _RetailerMainPageState();
}

class _RetailerMainPageState extends State<RetailerMainPage> {
  int pageIndex = 0;
  late String? getName = "";
  late String? getType = "";

  final List<StatefulWidget> pages = [
    const RetailerDashboard(),
    const RetailerAddDetails(),
    const RetailerStats(),
  ];

  Future<void> _getShopName() async {
    await FirebaseFirestore.instance
        .collection('Retailer')
        .doc((FirebaseAuth.instance.currentUser)!.uid)
        .get()
        .then((value) {
      print(value.data()!['shopName'].toString());
      setState(() {
        getName = value.data()!['shopName'].toString().length > 10
            ? "${value.data()!['shopName'].toString().substring(0, 10)}..."
            : value.data()!['shopName'].toString();
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    _getShopName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.store,
              color: primaryPurple,
            ),
            const SizedBox(width: 10),
            Text(
              getName.toString(),
              style: GoogleFonts.poppins(color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.black,
            ),
            onPressed: () async {
              await AuthServices.signOut(context);
            },
          ),
        ],
      ),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 74,
      decoration: const BoxDecoration(
        color: primaryPurple,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          pageIndex == 0
              ? Column(
                  children: [
                    IconButton(
                        enableFeedback: false,
                        onPressed: () {
                          setState(() {
                            pageIndex = 0;
                          });
                        },
                        icon: const Icon(
                          Icons.dashboard,
                          color: Colors.white,
                          size: 35,
                        )),
                    Text(
                      'Dashboard',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ],
                )
              : IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  icon: const Icon(
                    Icons.dashboard_outlined,
                    color: Colors.white,
                    size: 35,
                  )),
          pageIndex == 1
              ? Column(
                  children: [
                    IconButton(
                        enableFeedback: false,
                        onPressed: () {
                          setState(() {
                            pageIndex = 1;
                          });
                        },
                        icon: const Icon(
                          Icons.add_circle,
                          color: Colors.white,
                          size: 35,
                        )),
                    Text(
                      'Add Details',
                      style: GoogleFonts.poppins(color: Colors.white),
                    )
                  ],
                )
              : IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  icon: const Icon(
                    Icons.add_circle_outline,
                    color: Colors.white,
                    size: 35,
                  )),
          pageIndex == 2
              ? Column(
                  children: [
                    IconButton(
                        enableFeedback: false,
                        onPressed: () {
                          setState(() {
                            pageIndex = 2;
                          });
                        },
                        icon: const Icon(
                          Icons.area_chart,
                          color: Colors.white,
                          size: 35,
                        )),
                    Text(
                      'Statistics',
                      style: GoogleFonts.poppins(color: Colors.white),
                    )
                  ],
                )
              : IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 2;
                    });
                  },
                  icon: const Icon(
                    Icons.area_chart_outlined,
                    color: Colors.white,
                    size: 35,
                  ))
        ],
      ),
    );
  }
}
