import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:listngo/constants.dart';
import 'package:listngo/screens/Retailer/add_a_product.dart';
import 'package:listngo/screens/Retailer/retailer_main_page.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({Key? key}) : super(key: key);

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final roles = [
    'Stationary',
    'General Stores',
    'Medicine',
    'Grocery Stores',
    'Others',
  ];
  String? selectedValue1;
  bool isRoleOthers = false;
  XFile? image;
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

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
                    // ElevatedButton(
                    //   //if user click this button, user can upload image from gallery
                    //   onPressed: () {
                    //     Navigator.pop(context);
                    //     getImage(ImageSource.gallery);
                    //   },
                    //   child: Row(
                    //     children: const [
                    //       Icon(Icons.image),
                    //       Text('From Gallery'),
                    //     ],
                    //   ),
                    // ),

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
                    // ElevatedButton(
                    //   //if user click this button. user can upload image from camera
                    //   onPressed: () {
                    //     Navigator.pop(context);
                    //     getImage(ImageSource.camera);
                    //   },
                    //   child: Row(
                    //     children: const [
                    //       Icon(Icons.camera),
                    //       Text('From Camera'),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  final ImagePicker picker = ImagePicker();
  @override
  void dispose() {
    _nameController.dispose();
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Add Description',
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: TextField(
                      minLines: 1,
                      maxLines: 2,
                      style: GoogleFonts.poppins(fontSize: 16),
                      // controller: _phoneNumberController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'About your shop',
                        hintStyle: GoogleFonts.poppins(),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Add an image',
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),

              image == null
                  ? GestureDetector(
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
                                horizontal: 16, vertical: 8),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.add_a_photo,
                                  size: 16,
                                ),
                                SizedBox(
                                  width: size.width * 0.05,
                                ),
                                Text(
                                  'Image of your shop',
                                  style: GoogleFonts.poppins(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : GestureDetector(
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
                                horizontal: 16, vertical: 8),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.add_a_photo,
                                  size: 16,
                                ),
                                SizedBox(
                                  width: size.width * 0.05,
                                ),
                                Text(
                                  'Change image',
                                  style: GoogleFonts.poppins(fontSize: 16),
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
              image != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          //to show image, you type like this.
                          File(image!.path),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                        ),
                      ),
                    )
                  : Container(),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Add a product',
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddAProduct(),
                    ),
                  );
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
                          const Icon(
                            Icons.add_box_sharp,
                            size: 16,
                          ),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          Text(
                            'Add a product',
                            style: GoogleFonts.poppins(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RetailerMainPage(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: primaryGreen,
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
    );
  }
}
