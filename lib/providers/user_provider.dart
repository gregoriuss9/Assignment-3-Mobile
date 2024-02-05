import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/user_model.dart';

class UserProvider with ChangeNotifier {
  List<UserModel> _users = <UserModel>[];

  final url_users = Uri.parse('https://jsonplaceholder.typicode.com/users');

  List<UserModel> get users {
    return [..._users];
  }

  Future<void> fetchUsers() async {
    try {
      final response_users = await http.get(url_users);
      final extractedDatauser =
          json.decode(response_users.body) as List<dynamic>;
      List<UserModel> loadedDatausers = [];

      extractedDatauser.forEach((users) {
        final currentUserData = UserModel(
          id: int.parse(users['id'].toString()),
          name: users['name'],
          username: users['username'],
          email: users['email'],
          street: users['address']['street'],
          suite: users['address']['suite'],
          city: users['address']['city'],
          zipcode: users['address']['zipcode'],
          lat: users['address']['geo']['lat'],
          lng: users['address']['geo']['lng'],
          phone: users['phone'],
          website: users['website'],
          company_name: users['company']['name'],
          company_catchPhrase: users['company']['catchPhrase'],
          company_bs: users['company']['bs'],
        );
        loadedDatausers.add(currentUserData);
      });

      _users = loadedDatausers;
    } catch (error) {
      rethrow;
    }
  }
}
