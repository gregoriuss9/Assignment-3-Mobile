import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final int id;
  final String name;
  final String username;
  final String email;
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final String lat;
  final String lng;
  final String phone;
  final String website;
  final String company_name;
  final String company_catchPhrase;
  final String company_bs;

  const UserCard({
    Key? key,
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.lat,
    required this.lng,
    required this.phone,
    required this.website,
    required this.company_name,
    required this.company_catchPhrase,
    required this.company_bs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(children: [
            Text(
              id.toString(),
            ),
            Text(
              "Name : " + name,
            ),
            Text(
              "Username : " + username,
            ),
            Text(
              "Email : " + email,
            ),
            Text(
              "Street : " + street,
            ),
            Text(
              "Suite : " + suite,
            ),
            Text(
              "City : " + city,
            ),
            Text(
              "Zipcode : " + zipcode,
            ),
            Text(
              "Geo lat : " + lat,
            ),
            Text(
              "Geo lng : " + lng,
            ),
            Text(
              "Phone no. : " + phone,
            ),
            Text(
              "Website : " + website,
            ),
            Text(
              "Company Name : " + company_name,
            ),
            Text(
              company_catchPhrase,
            ),
            Text(
              company_bs,
            ),
          ])),
    );
  }
}
