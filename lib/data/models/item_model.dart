// data/models/item_model.dart
class ItemModel {
  final String id;
  final String name;
  final String rate;
  final String qty;

  ItemModel({required this.id, required this.name, required this.rate, required this.qty});

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      name: json['name'],
      rate: json['rate'],
      qty: json['qty'],
    );
  }
}