import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  static saveUserCustomer(String email, uid) async {
    await FirebaseFirestore.instance
        .collection('Customer')
        .doc(uid)
        .set({'email': email});
  }

  static saveUserRetailer(String email, uid) async {
    await FirebaseFirestore.instance
        .collection('Retailer')
        .doc(uid)
        .set({'email': email});
  }
}
