import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.onChanged,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.validator,
    this.margin,
    this.padding,
    this.obscureText,
    this.suffixIcon,
    this.labelText,
    this.initialValue,
  }) : super(key: key);
  final Function? onChanged;
  final Function? validator;

  final TextEditingController? controller;
  final String? hintText;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final bool? obscureText;
  final String? labelText;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    if (width > height) {
      width = height;
    }
    return Padding(
      padding: margin ?? const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: padding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextFormField(
            initialValue: initialValue,
            obscureText: obscureText ?? false,
            validator: ((value) =>
                (validator != null ? validator!(value) : null)),
            controller: controller,
            style: GoogleFonts.poppins(fontSize: 16),
            decoration: InputDecoration(
              labelText: labelText,
              alignLabelWithHint: true,
              border: InputBorder.none,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(),
            ),
            onChanged: (value) {
              onChanged!(value);
            },
          ),
        ),
      ),
    );
  }
}
