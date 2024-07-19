import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../global/environment.dart';

class AuthService with ChangeNotifier {
  Future login(String email, String password) async {
    final data = {
      'email': email,
      'password': password,
    };

    final url = Uri.https(Environment.apiUrl, '/api/auth');

    final resp = await http.post(url, body: jsonEncode(data), headers: {
      'Content-Type': 'application/json',
    });

    print(resp.body);
  }
}
