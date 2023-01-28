class Customer {
  String id;
  String name;
  String email;
  String phone;
  String address;
  String password;

  Customer({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.password,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'password': password,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      address: map['address'],
      password: map['password'],
    );
  }

  Customer.fromJson(Map<String, dynamic> json)
      : id = json['id']?? null,
        name = json['name']?? null,
        email = json['email']?? null,
        phone = json['phone']?? null,
        address = json['address']?? null,
        password = json['password']?? null;
}
