import 'package:flutter/material.dart';
import 'package:listngo/screens/onboarding_screen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
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
      home: const OnBoardingScreen(),
      // home: StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshot) {
      //     if (kDebugMode) {
      //       print(snapshot);
      //     }
      //     if (snapshot.hasData) {
      //       return const OnBoardingScreen();
      //     } else {
      //       return const OnBoardingScreen();
      //     }
      //   },
      // ),
    );
  }
}
