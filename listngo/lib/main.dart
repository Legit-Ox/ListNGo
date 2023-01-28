import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:listngo/screens/onboarding_screen.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:listngo/utilities/Location.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(
          // photoSize: MediaQuery.of(context).size.height,
          seconds: 3,
          navigateAfterSeconds: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              registerPlatformInstance();
              if (kDebugMode) {
                print(snapshot);
              }
              if (snapshot.hasData) {
                return const OnBoardingScreen();
              } else {
                return const OnBoardingScreen();
              }
            },
          ),
          // image: new Image.asset(
          //   'assets/images/splash.png',
          //   fit: BoxFit.cover,
          // ),
          imageBackground: const AssetImage('assets/images/splash.png'),
          useLoader: false,
        ));
  }
}
