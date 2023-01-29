import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  static saveUserCustomer(uid, String email, String password) async {
    await FirebaseFirestore.instance
        .collection('Customer')
        .doc(uid)
        .set({"email": email, "password": password});
  }

  static saveUserRetailer(uid, String email, String password) async {
    await FirebaseFirestore.instance
        .collection('Retailer')
        .doc(uid)
        .set({"email": email, "password": password, "Products": []});
  }
}
