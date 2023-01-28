import 'package:flutter/material.dart';

class Shop {
  final String image, name, type, location;

  final Color bgColor;

  Shop({
    required this.image,
    required this.name,
    required this.type,
    required this.location,
    this.bgColor = const Color(0xFFEFEFF2),
  });
}

List<Shop> demo_shop = [
  Shop(
    image: "assets/images/shop1.jfif",
    name: "Agarwal Groceries",
    type: "Grocery",
    location: "Shahibaug",
  ),
  Shop(
    image: "assets/images/shop2.jfif",
    name: "Medkart Stores",
    type: "Pharmacy",
    location: "Navrangpura",
  ),
  Shop(
    image: "assets/images/shop3.jfif",
    name: "Curved Hem Shirts",
    type: "Electronics",
    location: "Usmanpura",
  ),
  Shop(
    image: "assets/images/shop4.jpg",
    name: "Jitendra Stationaries",
    type: "Stationary",
    location: "Sabarmati",
  ),
];
