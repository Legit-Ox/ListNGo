import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listngo/constants.dart';

class RetailerDetailScreen extends StatelessWidget {
  const RetailerDetailScreen(
      {Key? key,
      required this.image,
      required this.title,
      required this.price,
      required this.description})
      : super(key: key);

  final String image, title, price, description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
        title: Text(
          'Preview',
          style: GoogleFonts.poppins(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.favorite_border_outlined,
                size: 20,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              image,
              height: MediaQuery.of(context).size.height * 0.4,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        "Rs$price",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      description,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const AddAProduct(),
                      //   ),
                      // );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: primaryPurple, width: 2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.mode_edit_outlined,
                                    color: primaryPurple,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 16),
                                    child: Text(
                                      'Edit product',
                                      style: GoogleFonts.poppins(
                                          fontSize: 18, color: primaryPurple),
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
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const AddAProduct(),
                      //   ),
                      // );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.red, width: 2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.mode_edit_outlined,
                                    color: Colors.red,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 16),
                                    child: Text(
                                      'Delete Product',
                                      style: GoogleFonts.poppins(
                                          fontSize: 18, color: Colors.red),
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
                  const SizedBox(height: 16 / 2),
                  // Row(
                  //   children: const [
                  //     ColorDot(
                  //       color: Color(0xFFBEE8EA),
                  //       isActive: false,
                  //     ),
                  //     ColorDot(
                  //       color: Color(0xFF141B4A),
                  //       isActive: true,
                  //     ),
                  //     ColorDot(
                  //       color: Color(0xFFF4E5C3),
                  //       isActive: false,
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: 16 * 2),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
