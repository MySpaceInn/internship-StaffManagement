import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SessionManager {
  // Secure storage instance
  final storage = FlutterSecureStorage();

  // Base URL for your API
  final String baseUrl = 'https://yourapi.com';

  // login and get tokens
  Future<void> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      await _storeTokens(data['accessToken'], data['refreshToken']);
    } else {
      throw Exception('Failed to login');
    }
  }

  // store tokens securely
  Future<void> _storeTokens(String accessToken, String refreshToken) async {
    await storage.write(key: 'accessToken', value: accessToken);
    await storage.write(key: 'refreshToken', value: refreshToken);
  }

  // get access token
  Future<String?> getAccessToken() async {
    return await storage.read(key: 'accessToken');
  }

  // get refresh token
  Future<String?> getRefreshToken() async {
    return await storage.read(key: 'refreshToken');
  }

  // refresh tokens
  Future<void> refreshTokens() async {
    final refreshToken = await getRefreshToken();
    if (refreshToken == null) throw Exception('No refresh token available');

    final response = await http.post(
      Uri.parse('$baseUrl/refresh'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'refreshToken': refreshToken}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      await _storeTokens(data['accessToken'], data['refreshToken']);
    } else {
      throw Exception('Failed to refresh token');
    }
  }

  // // Function to perform an authenticated GET request
  // Future<http.Response> getWithToken(String endpoint) async {
  //   String? accessToken = await getAccessToken();
    
  //   final response = await http.get(
  //     Uri.parse('$baseUrl/$endpoint'),
  //     headers: {'Authorization': 'Bearer $accessToken'},
  //   );

  //   if (response.statusCode == 401) {
  //     // Token expired, refresh tokens
  //     await refreshTokens();
  //     accessToken = await getAccessToken();
      
  //     // Retry the request
  //     return await http.get(
  //       Uri.parse('$baseUrl/$endpoint'),
  //       headers: {'Authorization': 'Bearer $accessToken'},
  //     );
  //   }

  //   return response;
  // }

  // // Function to logout and clear tokens
  // Future<void> logout() async {
  //   await storage.delete(key: 'accessToken');
  //   await storage.delete(key: 'refreshToken');
  // }
}
