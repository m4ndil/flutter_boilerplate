import 'package:flutter/material.dart';
import '../../data/models/item_model.dart';
import '../../data/repository/item_repository.dart';

class ItemProvider with ChangeNotifier {
  final ItemRepository _itemRepository = ItemRepository();
  List<ItemModel> _items = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<ItemModel> get items => _items;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchItems(String token) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _items = await _itemRepository.getItemList(token);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
