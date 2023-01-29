// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:listngo/widgets/shop_card.dart';

// import 'section_title.dart';

// class ShopList extends StatefulWidget {
//   const ShopList({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<ShopList> createState() => ShopListState();
// }

// class ShopListState extends State<ShopList> {
//   var Retailers = [];

//   Future<void> setRetailers() async {
//     CollectionReference collectionRef =
//         FirebaseFirestore.instance.collection('Retailer');

//     // Get docs from collection reference
//     QuerySnapshot querySnapshot = await collectionRef.get();

//     // Get data from docs and convert map to List
//     for (var doc in querySnapshot.docs) {
//       var data = doc.data();
//       Retailers.add(doc);
//     }

//     print(Retailers);
//     setState(() {
//       Retailers = Retailers;
//     });
//     // print(allData);
//   }

//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   setRetailers();
//   //   super.initState();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
        
//       ],
//     );
//   }
// }
