import 'dart:convert';

class Customer {
  String name;
  String email;
  String phone;
  String password;

  Customer({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());
}
