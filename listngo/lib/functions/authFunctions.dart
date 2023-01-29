import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:listngo/functions/firebaseFunctions.dart';
import 'package:listngo/screens/choose_role_screen.dart';

class AuthServices {
  final googleSignIn = GoogleSignIn();

  static signupUser(
      String type, String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await FirebaseAuth.instance.currentUser!.updateDisplayName(email);
      await FirebaseAuth.instance.currentUser!.updateEmail(email);
      if (type == 'Customer') {
        await FirestoreServices.saveUserCustomer(
            userCredential.user!.uid, email, password);
      } else if (type == 'Retailer') {
        await FirestoreServices.saveUserRetailer(
            userCredential.user!.uid, email, password);
      }
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration Successful')));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password Provided is too weak')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email Provided already Exists')));
      }
      return "";
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      return "";
    }
    return "Success";
  }

  static signinUser(String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('You are Logged in')));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No user Found with this Email')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password did not match')));
      }
      return "";
    }
    return "Success";
  }

  static logIniwthGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credentials = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print("WOOOPSSSS");
        print(e.message);
        return "";
      }
      rethrow;
    }
    return "Success";
  }

  static signInwithGoogle(String type) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credentials = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credentials);

      if (type == 'Customer') {
        await FirestoreServices.saveUserCustomer(
          userCredential.user!.uid,
          userCredential.user!.email!,
          userCredential.user!.displayName!,
        );
      } else if (type == 'Retailer') {
        await FirestoreServices.saveUserRetailer(
          userCredential.user!.uid,
          userCredential.user!.email!,
          userCredential.user!.displayName!,
        );
      }
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print("WOOOPSSSS");
        print(e.message);
        return "";
      }
      rethrow;
    }
    return "Success";
  }

  Future<void> signOutFromGoogle() async {
    await GoogleSignIn().disconnect();
    await FirebaseAuth.instance.signOut();
  }

  static Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ChooseRoleScreen()));
  }
}
