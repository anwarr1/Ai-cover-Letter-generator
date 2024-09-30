import 'dart:convert';
import 'package:cover_letter_generator/model/User.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String apiUrl = 'http://10.0.2.2:8081/';

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
    print("Response: ${response.body}");
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      print('User signed up successfully');
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
        String token =
            responseData['token']; // Assuming the token is in the response body
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
}
