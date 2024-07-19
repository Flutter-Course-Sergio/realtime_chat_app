import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../global/environment.dart';
import '../models/models.dart';

class AuthService with ChangeNotifier {
  late User user;
  final _storage = const FlutterSecureStorage();
  bool _isAuthenticating = false;
  bool _isRegisteting = false;

  bool get isAuthenticating => _isAuthenticating;
  bool get isRegistering => _isRegisteting;

  set isAuthenticating(bool value) {
    _isAuthenticating = value;
    notifyListeners();
  }

  set isRegistering(bool value) {
    _isRegisteting = value;
    notifyListeners();
  }

  static Future<String> getToken() async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');

    if (token == null) return '';
    return token;
  }

  static Future<void> deleteToken() async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: 'token');
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
      await _saveToken(loginResponse.token);
      return true;
    } else {
      return false;
    }
  }

  Future register(String name, String email, String password) async {
    isRegistering = true;

    final data = {
      'name': name,
      'email': email,
      'password': password,
    };

    final url = Uri.https(Environment.apiUrl, '/api/auth/new');

    final resp = await http.post(url, body: jsonEncode(data), headers: {
      'Content-Type': 'application/json',
    });

    isRegistering = false;

    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      user = loginResponse.user;
      await _saveToken(loginResponse.token);
      return true;
    } else {
      final respBody = jsonDecode(resp.body);
      return respBody['msg'];
    }
  }

  Future<bool> isTokenValid() async {
    final token = await _storage.read(key: 'token');

    final url = Uri.https(Environment.apiUrl, '/api/auth/renew');

    final resp = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    });

    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      user = loginResponse.user;
      await _saveToken(loginResponse.token);
      return true;
    } else {
      logout();
      return false;
    }
  }

  Future _saveToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  Future logout() async {
    return await _storage.delete(key: 'token');
  }
}
