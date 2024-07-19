import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../global/environment.dart';
import '../models/models.dart';

class AuthService with ChangeNotifier {
  late User user;
  bool _isAuthenticating = false;

  bool get isAuthenticating => _isAuthenticating;

  set isAuthenticating(bool value) {
    _isAuthenticating = value;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    isAuthenticating = true;

    final data = {
      'email': email,
      'password': password,
    };

    final url = Uri.https(Environment.apiUrl, '/api/auth');

    final resp = await http.post(url, body: jsonEncode(data), headers: {
      'Content-Type': 'application/json',
    });

    isAuthenticating = false;

    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      user = loginResponse.user;
      return true;
    } else {
      return false;
    }
  }
}
