import 'package:flutter/material.dart';
import 'package:test_pos/data/repository/auth_repository.dart';
import 'dart:convert';
import '../../data/models/user_model.dart';
import '../../core/services/storage_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();
  UserModel? _user;
  bool _isLoading = false;
  String? _errorMessage;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Load session from storage when app starts
  Future<void> loadSession() async {
    String? storedUser = await StorageService.getUserSession();
    if (storedUser != null) {
      _user = UserModel.fromJson(json.decode(storedUser));
      notifyListeners();
    }
  }

  // Login function with session saving
  Future<void> login(String username, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _user = await _authRepository.login(username, password);
      if (_user != null) {
        await StorageService.saveUserSession(json.encode(_user!.toJson()));
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Logout function with session clearing
  void logout() async {
    _user = null;
    await StorageService.clearUserSession();
    notifyListeners();
  }
}
