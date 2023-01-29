import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:listngo/constants.dart';
import 'package:listngo/screens/Retailer/add_a_product.dart';
import 'package:listngo/screens/Retailer/retailer_main_page.dart';
import 'package:listngo/utilities/customer_textfield.dart';

class RegisterPageRetailers4 extends StatefulWidget {
  const RegisterPageRetailers4({Key? key}) : super(key: key);

  @override
  State<RegisterPageRetailers4> createState() => _RegisterPageRetailers4State();
}

class _RegisterPageRetailers4State extends State<RegisterPageRetailers4> {
  final _descController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _db = FirebaseFirestore.instance;
  final picker = ImagePicker();
  File? _image;
  late String? _url;
  final roles = [
    'Stationary',
    'General Stores',
    'Medicine',
    'Grocery Stores',
    'Others',
  ];
  String? selectedValue1;
  bool isRoleOthers = false;

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text(
              'Please choose media to select',
              style: GoogleFonts.poppins(),
            ),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        getImage(ImageSource.gallery);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.add_a_photo,
                                  size: 16,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'From Gallery',
                                  style: GoogleFonts.poppins(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        getImage(ImageSource.camera);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.add_a_photo,
                                  size: 16,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'From Camera',
                                  style: GoogleFonts.poppins(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future UpdateURL() async {
    // create a reference to the location you want to upload to
    var imageRef =
        FirebaseStorage.instance.ref().child("${DateTime.now()}.jpg");

    // upload the file
    var uploadTask = imageRef.putFile(_image!);

    // Wait until the upload completes
    var url = await (await uploadTask.whenComplete(
      () {
        return null;
      },
    ))
        .ref
        .getDownloadURL();

    setState(() {
      _url = url;
    });
  }

  Future getImage(ImageSource media) async {
    var img = await picker.getImage(source: media);
    final File image = File(img!.path);
    setState(() {
      _image = image;
      UpdateURL();
    });
  }

  @override
  void dispose() {
    _descController.dispose();
    _phoneNumberController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _image == null
                    ? SizedBox(
                        height: size.height * 0.1,
                      )
                    : Container(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    'Fill this to optimize your sales',
                    style: GoogleFonts.poppins(
                        fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    'By filling these extra details you\'ll gain more customers through our platform which will help you expand',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25),
                //   child: Text(
                //     'Add Description',
                //     style: GoogleFonts.poppins(
                //         fontSize: 18, fontWeight: FontWeight.w500),
                //   ),
                // ),
                CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some description';
                    }
                    return null;
                  },
                  controller: _descController,
                  hintText: 'About your shop',
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: Colors.grey[200],
                //       border: Border.all(color: Colors.white),
                //       borderRadius: BorderRadius.circular(12),
                //     ),
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(
                //           horizontal: 16, vertical: 8),
                //       child: TextFormField(
                //         validator: (value) {
                //           if (value!.isEmpty) {
                //             return 'Please enter your shop name';
                //           }
                //           return null;
                //         },
                //         controller: _descController,
                //         minLines: 1,
                //         maxLines: 2,
                //         style: GoogleFonts.poppins(fontSize: 16),
                //         // controller: _phoneNumberController,
                //         decoration: InputDecoration(
                //           border: InputBorder.none,
                //           hintText: 'About your shop',
                //           hintStyle: GoogleFonts.poppins(),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25),
                //   child: Text(
                //     'Add an image',
                //     style: GoogleFonts.poppins(
                //         fontSize: 20, fontWeight: FontWeight.w500),
                //   ),
                // ),

                GestureDetector(
                  onTap: () {
                    myAlert();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        child: Row(
                          children: [
                            const Icon(Icons.add_a_photo,
                                size: 16, color: Colors.black54),
                            SizedBox(
                              width: size.width * 0.05,
                            ),
                            Text(
                              _image == null
                                  ? 'Image of your shop'
                                  : 'Change the image',
                              style: GoogleFonts.poppins(
                                  fontSize: 16, color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //if image not null show the image
                //if image null show text
                _image != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            //to show image, you type like this.
                            File(_image!.path),
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            height: 300,
                          ),
                        ),
                      )
                    : SizedBox(
                        height: size.height * 0.02,
                      ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25),
                //   child: Text(
                //     'Add a product',
                //     style: GoogleFonts.poppins(
                //         fontSize: 20, fontWeight: FontWeight.w500),
                //   ),
                // ),

                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => const AddAProduct(),
                //       ),
                //     );
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 25),
                //     child: Container(
                //       decoration: BoxDecoration(
                //         color: Colors.grey[200],
                //         border: Border.all(color: Colors.white),
                //         borderRadius: BorderRadius.circular(12),
                //       ),
                //       child: Padding(
                //         padding: const EdgeInsets.symmetric(
                //             horizontal: 16, vertical: 16),
                //         child: Row(
                //           children: [
                //             const Icon(Icons.add_box_sharp,
                //                 size: 16, color: Colors.black54),
                //             SizedBox(
                //               width: size.width * 0.05,
                //             ),
                //             Text(
                //               'Add a product',
                //               style: GoogleFonts.poppins(
                //                   fontSize: 16, color: Colors.black54),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: size.height * 0.02,
                // ),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _db
                          .collection('Retailer')
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .update({
                        'description': _descController.text.trim(),
                        'shopImage': _url,
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RetailerMainPage(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Something went wrong'),
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: primaryPurple,
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                child: Text(
                                  'Done',
                                  style: GoogleFonts.poppins(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
