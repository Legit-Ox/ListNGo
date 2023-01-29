import 'package:flutter/material.dart';

import 'package:listngo/constants.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen(
      {Key? key,
      required this.image,
      required this.name,
      required this.price,
      required this.description})
      : super(key: key);

  final String image, name, price, description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
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
      body: Column(
        children: [
          Image.network(
            image,
            height: MediaQuery.of(context).size.height * 0.4,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Container(
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
                      // Expanded(
                      //   child: Text(
                      //     headline6,
                      //     style: Theme.of(context).textTheme.titleLarge,
                      //   ),
                      // ),
                      const SizedBox(width: 16),
                      Text(
                        "\Rs$price",
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
                  Text(
                    "Colors",
                    style: Theme.of(context).textTheme.titleSmall,
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
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryGreen,
                            shape: const StadiumBorder()),
                        child: const Text("Add to Cart"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
