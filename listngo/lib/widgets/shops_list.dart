import 'package:flutter/material.dart';
import 'package:listngo/models/Shop.dart';
import 'package:listngo/widgets/shop_card.dart';


import 'section_title.dart';

class ShopList extends StatelessWidget {
  const ShopList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: SectionTitle(
            title: "Shops",
            pressSeeAll: () {},
          ),
        ),
        Column(
          children: List.generate(
            demo_shop.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ShopCard(
                name: demo_shop[index].name,
                image: demo_shop[index].image,
                type: demo_shop[index].type,
                location: demo_shop[index].location,
                bgColor: demo_shop[index].bgColor,
                press: () {},
              ),
            ),
          ),
        )
      ],
    );
  }
}
