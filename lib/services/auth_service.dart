import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_auth_with_laravel/utils/constants.dart';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';
import 'storage_service.dart';

class AuthService {
  final StorageService _storageService = StorageService();

  Future<User> register(
      String name, String email, String password, String phone) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      }),
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> data = json.decode(response.body);
      return User.fromJson(data['data']);
    } else {
      throw Exception('Failed to register user');
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final String token = data['data']['token'];
      await _storageService.setToken(token);

      // Tambahkan log untuk menampilkan token
      debugPrint('Login successful. Token: $token');

      return {
        'user': User.fromJson(data['data']['user']),
        'token': token,
      };
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<void> logout() async {
    final token = await _storageService.getToken();
    if (token != null) {
      debugPrint('Logging out. Current token: $token');
      final response = await http.post(
        Uri.parse('$baseUrl/logout'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        await _storageService.deleteToken();
        debugPrint('Logout successful. Token deleted.');
      } else {
        throw Exception('Failed to logout');
      }
    }
  }

  Future<bool> isLoggedIn() async {
    final token = await _storageService.getToken();
    // Tambahkan log untuk menampilkan status login dan token
    debugPrint('Checking login status. Token: ${token ?? 'No token found'}');
    return token != null;
  }
}
