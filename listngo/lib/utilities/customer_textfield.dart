import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.onChanged,
    this.controller,
    this.hintText,
    this.prefixIcon,
  }) : super(key: key);
  final Function onChanged;

  final TextEditingController? controller;
  final String? hintText;
  final Icon? prefixIcon;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    if (width > height) {
      width = height;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextField(
            controller: controller,
            style: GoogleFonts.poppins(fontSize: 16),
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: prefixIcon,
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(),
            ),
            onChanged: (value) {
              onChanged(value);
            },
          ),
        ),
      ),
    );
  }
}
