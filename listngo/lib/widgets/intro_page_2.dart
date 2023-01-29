import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            alignment: Alignment.center,
            child: SvgPicture.asset(
              "assets/images/first2.svg",
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.07, 0, 0, 0),
            child: Text(
              'From head to toe, you\'ve got it all!',
              style: GoogleFonts.poppins(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.07, 0, 10, 0),
            child: Text(
              'the convenient way to shop for your daily essentials.',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
