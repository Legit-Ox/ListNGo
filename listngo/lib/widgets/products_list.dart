import 'package:flutter/material.dart';
import 'package:listngo/screens/Customer/all_products_screen.dart';
import 'package:listngo/widgets/section_title.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: SectionTitle(
            title: "Products",
            pressSeeAll: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AllProductsScreen(),
                ),
              );
            },
          ),
        ),
        // SingleChildScrollView(
        //   physics: const BouncingScrollPhysics(
        //       parent: AlwaysScrollableScrollPhysics()),
        //   scrollDirection: Axis.horizontal,
        //   child: Row(
        //     children: List.generate(
        //       demo_product.length,
        //       (index) => Padding(
        //         padding: const EdgeInsets.only(right: 16),
        //         child: ProductCard(
        //           title: demo_product[index].title,
        //           image: demo_product[index].image,
        //           price: demo_product[index].price,
        //           press: () {
        //             Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                   builder: (context) =>
        //                       DetailsScreen(product: demo_product[index]),
        //                 ));
        //           },
        //         ),
        //       ),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
