import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

import 'model.dart';

class ApiProvider with ChangeNotifier {
  List<UserModel> _users = [];
  List<UserModel> get users => _users;

  Future<void> fetchUsers(int page) async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users?page=1&per_page=12'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['data'] != null) {
        List<UserModel> loadedUsers = [];
        for (var user in data['data']) {
          loadedUsers.add(UserModel.fromJson(user));
        }
        _users = loadedUsers;
      notifyListeners();
      }
    } else {
      throw Exception('Failed to load users');
    }
  }
}