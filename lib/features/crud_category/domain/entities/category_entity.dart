import 'package:freezed_annotation/freezed_annotation.dart';
part 'category_entity.freezed.dart';
part 'category_entity.g.dart';

@freezed
class Category with _$Category {
  factory Category({
    int? id,
    required String name_cat,
    required bool isDeleted,
    required int version,
  }) = _Category;

  factory Category.fromJson(Map<String, Object?> json) =>
      _$CategoryFromJson(json);
}
