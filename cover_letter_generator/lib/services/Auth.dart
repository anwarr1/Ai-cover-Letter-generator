import 'dart:convert';
import 'package:cover_letter_generator/model/User.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String apiUrl = 'http://192.168.11.120:8081';

  Future<void> signUp(User user) async {
    final response = await http.post(
      Uri.parse('$apiUrl/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'firstName': user.firstName,
        'lastName': user.lastName,
        'email': user.email,
        'password': user.password,
      }),
    );
    if (response.statusCode == 200) {
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to sign up user');
    }
  }

  Future<String> signIn(User user) async {
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'email': user.email,
          'password': user.password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        String token = responseData['token'];
        print("JWT Token: $token");

        // Store the token in SharedPreferences or another secure storage method
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('jwt_token', token);

        return token; // Return the token if needed
      } else {
        throw Exception(
            'Failed to sign in: ${response.statusCode} ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to sign in user: $e');
    }
  }

  Future<User> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('jwt_token')!;
    try {
      final response = await http.get(
          headers: {'Authorization': "Bearer $token"},
          Uri.parse('$apiUrl/user'));
      User user = User.fromJson(jsonDecode(response.body));
      return user; // Assuming you have a fromJson method in User class
    } catch (e) {
      throw Exception('Failed to get current user: $e');
    }
  }
}
