import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  static const String Connect = 'http://127.0.0.1:8000/api/login';

  Future<void> login(String emailOrUsername, String password) async {
    try {
      final response = await http.post(Uri.parse(Connect), body: {
        'email': emailOrUsername,
        'password': password,
      });

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final user = jsonResponse['user'];

        // Simpan setiap elemen di dalam user ke SharedPreferences

        print("hai");
      } else if (response.statusCode == 401) {
        throw Exception('Invalid email or password');
      } else {
        throw Exception('Failed to login2');
      }
    } catch (e) {
      print('$e');
      throw Exception('$e');
    }
  }

  static const String ConnectRegister = 'http://127.0.0.1:8000/api/register';
  Future<void> register(
      String name, String Username, String email, String password) async {
    try {
      final response = await http.post(Uri.parse(ConnectRegister), body: {
        'name': name,
        'username': Username,
        'email': email,
        'password': password,
      });

      if (response.statusCode == 201) {
        final jsonResponse = json.decode(response.body);
        final user = jsonResponse['user'];

        print("User registered successfully");
        print("User details:");
        print("ID: ${user['id']}");
        print("Name: ${user['name']}");
        print("Email: ${user['email']}");
        // ... tambahkan info pengguna lainnya sesuai kebutuhan
      } else if (response.statusCode == 422) {
        final jsonResponse = json.decode(response.body);
        final errors = jsonResponse['errors'];
        throw Exception(errors);
      } else {
        throw Exception('Failed to register');
      }
    } catch (e) {
      print('$e');
      throw Exception('Failed to register');
    }
  }

  Future<void> saveUserToSharedPreferences(Map<String, dynamic> user) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setInt('user_id', int.parse(user['id'].toString()));
      await prefs.setString('user_name', user['username']);
      await prefs.setString('user_email', user['email']);

      final userName = prefs.getString('user_name');
      print('$userName');
    } catch (e) {
      print('$e');
      throw Exception('Failed to save user data');
    }
  }
}
