import 'package:distribution/features/crud_category/domain/entities/isar_category_entity.dart';
import 'package:isar/isar.dart';
part 'isar_products_entity.g.dart';

@collection
@Name('product')
class LocalProduct {
  late Id id;
  late double price;
  late String name;
  late bool isDeleted;
  late int version;
  final category = IsarLink<CategoryLocal>();
}
