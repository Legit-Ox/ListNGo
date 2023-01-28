import 'package:flutter/animation.dart';
import 'package:listngo/constants.dart';

class Category {
  final String icon, title;
  final Color color;

  Category({required this.icon, required this.title, required this.color});
}

List<Category> demo_categories = [
  Category(
    icon: "assets/icons/dress.svg",
    title: "Electronics",
    color: secondaryPurpleTint.withOpacity(0.3),
  ),
  Category(
    icon: "assets/icons/shirt.svg",
    title: "Grocery",
    color: secondaryPurpleTint.withOpacity(0.3),
  ),
  Category(
    icon: "assets/icons/pants.svg",
    title: "Stationary",
    color: secondaryPurpleTint.withOpacity(0.3),
  ),
  Category(
    icon: "assets/icons/Tshirt.svg",
    title: "Clothes",
    color: secondaryPurpleTint.withOpacity(0.3),
  ),
  Category(
    icon: "assets/icons/Tshirt.svg",
    title: "Pharmacy",
    color: secondaryPurpleTint.withOpacity(0.3),
  ),
];
