// data/repositories/auth_repository.dart
import '../models/user_model.dart';
import '../../core/services/api_service.dart';

class AuthRepository {
  final ApiService _apiService = ApiService();

  Future<UserModel?> login(String username, String password) async {
    try {
      final response = await _apiService.login(username, password);
      return response != null ? UserModel.fromJson(response) : null;
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }
}