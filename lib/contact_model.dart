// To parse this JSON data, do
//
//     final contact = contactFromJson(jsonString);

import 'dart:convert';

Contact contactFromJson(String str) => Contact.fromJson(json.decode(str));

String contactToJson(Contact data) => json.encode(data.toJson());

class Contact {
  Contact({
    required this.name,
    required this.phone,
    required this.email,
    required this.region,
    required this.country,
    required this.image,
  });

  String name;
  String phone;
  String email;
  String region;
  String country;
  String image;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    region: json["region"],
    country: json["country"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "email": email,
    "region": region,
    "country": country,
    "image": image,
  };
}
