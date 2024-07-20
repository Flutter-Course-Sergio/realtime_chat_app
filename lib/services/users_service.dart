import 'package:http/http.dart' as http;

import '../global/environment.dart';
import '../models/models.dart';
import 'services.dart';

class UserService {
  Future<List<User>> getUsers() async {
    try {
      final token = await AuthService.getToken();
      final url = Uri.https(Environment.apiUrl, "/api/users");

      final resp = await http.get(url, headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      });

      if (resp.statusCode == 200) {
        final usersReponse = usersResponseFromJson(resp.body);
        return usersReponse.users;
      } else {
        return [];
      }
    } catch (_) {
      return [];
    }
  }
}
