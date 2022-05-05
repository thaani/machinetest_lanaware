// class Employee {
//   Employee({
//     required this.id,
//     required this.name,
//     required this.username,
//     required this.email,
//     required this.profile_image,
//     required this.address,
//     required this.phone,
//     required this.website,
//     required this.company,
//   });

//   Employee.fromJson(dynamic json) {
//     id = json['id'].toString();
//     name = json['name'].toString();
//     username = json['username'].toString();
//     email = json['email'].toString();
//     profile_image = json['profile_image'].toString();
//     address = json['address'].toString();
//     phone = json['phone'].toString();
//     website = json['website'].toString();
//     company = json['company'].toString();
//   }

//   late final String id;
//   late final String name;
//   late final String username;
//   late final String email;
//   late final String profile_image;
//   late final String address;
//   late final String phone;
//   late final String website;
//   late final String company;

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['username'] = username;
//     _data['email'] = email;
//     _data['profile_image'] = profile_image;
//     _data['address'] = address;
//     _data['phone'] = phone;
//     _data['website'] = website;
//     _data['company'] = company;
//     return _data;
//   }

// }

// class Address {
//     Address({
//         this.street,
//         this.suite,
//         this.city,
//         this.zipcode,
//         this.geo,
//     });

//     String street;
//     String suite;
//     String city;
//     String zipcode;
//     Geo geo;

//     factory Address.fromJson(Map<String, dynamic> json) => Address(
//         street: json["street"].toString(),
//         suite: json["suite"].toString(),
//         city: json["city"].toString(),
//         zipcode: json["zipcode"].toString(),
//         geo: Geo.fromJson(json["geo"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "street": street,
//         "suite": suite,
//         "city": city,
//         "zipcode": zipcode,
//         "geo": geo.toJson(),
//     };
// }

// class Geo {
//     Geo({
//         this.lat,
//         this.lng,
//     });

//     String lat;
//     String lng;

//     factory Geo.fromJson(Map<String, dynamic> json) => Geo(
//         lat: json["lat"].toString(),
//         lng: json["lng"].toString(),
//     );

//     Map<String, dynamic> toJson() => {
//         "lat": lat,
//         "lng": lng,
//     };
// }

// class Company {
//     Company({
//         this.name,
//         this.catchPhrase,
//         this.bs,
//     });

//     String name;
//     String catchPhrase;
//     String bs;

//     factory Company.fromJson(Map<String, dynamic> json) => Company(
//         name: json["name"].toString(),
//         catchPhrase: json["catchPhrase"].toString(),
//         bs: json["bs"].toString(),
//     );

//     Map<String, dynamic> toJson() => {
//         "name": name,
//         "catchPhrase": catchPhrase,
//         "bs": bs,
//     };
// }

// To parse this JSON data, do
//
//     final employee = employeeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

// List<Employee> employeeFromJson(String str) => List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));

// String employeeToJson(List<Employee> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Employee {
  Employee({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.profileImage,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  int id;
  String name;
  String username;
  String email;
  String profileImage;
  Address address;
  String phone;
  String website;
  Company company;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: int.parse(json['id'].toString()),
        name: json["name"].toString(),
        username: json["username"].toString(),
        email: json["email"].toString(),
        profileImage: json["profile_image"].toString(),
        address: Address.fromJson(json['address'] as Map<String, dynamic>),
        phone: json["phone"].toString(),
        website: json["website"].toString(),
        company: Company.fromJson(json["company"] as Map<String, dynamic>),
      );

  // Map<String, dynamic> toJson() => {
  //     "id": id,
  //     "name": name,
  //     "username": username,
  //     "email": email,
  //     "profile_image": profileImage == null ? null : profileImage,
  //     "address": address.toJson(),
  //     "phone": phone == null ? null : phone,
  //     "website": website == null ? null : website,
  //     "company": company == null ? null : company.toJson(),
  // };
}

class Address {
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"].toString(),
        suite: json["suite"].toString(),
        city: json["city"].toString(),
        zipcode: json["zipcode"].toString(),
        geo: Geo.fromJson(json["geo"] as Map<String, dynamic>),
      );

  // Map<String, dynamic> toJson() => {
  //       "street": street,
  //       "suite": suite,
  //       "city": city,
  //       "zipcode": zipcode,
  //       "geo": geo.toJson(),
  //     };
}

class Geo {
  Geo({
    required this.lat,
    required this.lng,
  });

  String lat;
  String lng;

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"].toString(),
        lng: json["lng"].toString(),
      );

  // Map<String, dynamic> toJson() => {
  //       "lat": lat,
  //       "lng": lng,
  //     };
}

class Company {
  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  String name;
  String catchPhrase;
  String bs;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"].toString(),
        catchPhrase: json["catchPhrase"].toString(),
        bs: json["bs"].toString(),
      );

  // Map<String, dynamic> toJson() => {
  //       "name": name,
  //       "catchPhrase": catchPhrase,
  //       "bs": bs,
  //     };
}
