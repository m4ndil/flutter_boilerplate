

// data/repositories/item_repository.dart
import '../models/item_model.dart';
import '../../core/services/api_service.dart';

class ItemRepository {
  final ApiService _apiService = ApiService();

  Future<List<ItemModel>> getItemList(String token) async {
    try {
      final response = await _apiService.getItemList(token);
      return response != null ? (response[''] as List).map((i) => ItemModel.fromJson(i)).toList() : [];
    } catch (e) {
      throw Exception('Failed to fetch items: $e');
    }
  }
}
