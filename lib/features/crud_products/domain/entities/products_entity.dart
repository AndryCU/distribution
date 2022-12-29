import 'package:freezed_annotation/freezed_annotation.dart';
part 'products_entity.freezed.dart';
part 'products_entity.g.dart';

@freezed
class Product with _$Product {
  factory Product(
      {int? id,
      required double price,
      required String name,
      required int idCat,
      required bool isDeleted,
      required int version}) = _Product;
  factory Product.fromJson(Map<String, Object?> json) =>
      _$ProductFromJson(json);
}
