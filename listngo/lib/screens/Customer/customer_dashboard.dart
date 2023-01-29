import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listngo/functions/authFunctions.dart';
import 'package:listngo/screens/Customer/shop_detail_screen.dart';
import 'package:listngo/widgets/categories.dart';
import 'package:listngo/widgets/image_slider_images.dart';
import 'package:listngo/widgets/section_title.dart';
import 'package:listngo/widgets/shop_card.dart';
import 'package:listngo/widgets/user_drawer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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
  late final PageController _scrollController = PageController();

  @override
  void initState() {
    getCurrentLocation(context);
    _getFutureAddress();
    setRetailers();
    super.initState();
  }

  late var Retailers = [];

  Future<void> setRetailers() async {
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('Retailer');

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await collectionRef.get();

    // Get data from docs and convert map to List
    for (var doc in querySnapshot.docs) {
      var data = doc.data();
      Retailers.add(data);
    }

    print(Retailers);
    setState(() {
      Retailers = Retailers;
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Row(
                  children: [
                    Flexible(
                      child: PageView.builder(
                          controller: _scrollController,
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            // child: ChoiceChip(
                            //   padding: const EdgeInsets.all(2),
                            //   label: Flexible(
                            //     child: Text(
                            //       _options[index],
                            //       softWrap: true,
                            //       style: GoogleFonts.poppins(
                            //           fontSize: 18,
                            //           color: Colors.white),
                            //     ),
                            //   ),

                            //   backgroundColor: const Color.fromARGB(
                            //       255, 69, 69, 69),
                            //   // color of selected chip
                            //   selectedColor: const Color.fromARGB(
                            //       255, 69, 69, 69),
                            //   // selected chip value
                            //   selected: _selectedIndex == index,
                            //   // onselected method
                            //   onSelected: (bool selected) {
                            //     Navigator.pop(context);
                            //     setState(() {
                            //       _selectedIndex =
                            //           (selected ? index : 0);
                            //     });

                            // textEditingController.value =
                            //     textEditingController.value
                            //         .copyWith(
                            //   text: _options[_selectedIndex],
                            //   selection:
                            //       TextSelection.fromPosition(
                            //     TextPosition(
                            //         offset:
                            //             _options[_selectedIndex]
                            //                 .length),
                            //   ),
                            //     );
                            //   },
                            //   shape: RoundedRectangleBorder(
                            //       side: const BorderSide(),
                            //       borderRadius:
                            //           BorderRadius.circular(2)),
                            // ),

                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                // image: DecorationImage(
                                //   fit: BoxFit.fitHeight,
                                //   image: AssetImage(
                                //     imagesForSliding[index],
                                //   ),
                                // ),
                              ),
                              child: Image.asset(
                                imagesForSliding[index],
                                fit: BoxFit.fitHeight,
                              ),
                              // padding: const EdgeInsets.all(8.0),
                              // child: GestureDetector(
                              //   child: Container(
                              //     // width: MediaQuery.of(context)
                              //     //         .size
                              //     //         .width *
                              //     //     0.8,
                              //     padding: const EdgeInsets.symmetric(
                              //         horizontal: 15, vertical: 4),
                              //     decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.circular(18),
                              //         color: Colors.blue),
                              //     child: Center(
                              //         child: Text(index.toString(),
                              //             style: GoogleFonts.poppins(
                              //                 fontSize: 18,
                              //                 color: Colors.black))),
                              //   ),
                              //   onTap: () {},
                              // ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Center(
                child: SmoothPageIndicator(
                  controller: _scrollController,
                  count: 5,
                  effect: const ExpandingDotsEffect(
                    dotColor: Color.fromARGB(255, 216, 197, 240),
                    activeDotColor: Color.fromARGB(255, 149, 86, 225),
                    dotHeight: 2,
                  ),
                ),
              ),
              // const ProductsList(),

              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: SectionTitle(
                  title: "Shops",
                  pressSeeAll: () {},
                ),
              ),
              Column(
                children: List.generate(
                  Retailers.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ShopCard(
                      name: Retailers[index]['shopName'],
                      image: Retailers[index]['shopImage'],
                      type: Retailers[index]['type'],
                      location: Retailers[index]['location'],
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShopDetailScreen(
                                      name: Retailers[index]['shopName'],
                                      image: Retailers[index]['shopImage'],
                                      type: Retailers[index]['type'],
                                      location: Retailers[index]['location'],
                                      products: Retailers[index]['Products'],
                                      description: Retailers[index]
                                          ['description'],
                                    )));
                      },
                    ),
                  ),
                ),
              )
            ])));
  }
}

// Future<String> getStreet() async {
//   return await getFutureAddress();
// }


