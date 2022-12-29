import 'package:isar/isar.dart';

import '../../../crud_products/domain/entities/isar_products_entity.dart';
part 'isar_category_entity.g.dart';

@collection
@Name('catproduct')
class CategoryLocal {
  late Id id;
  late String name_cat;
  late int version;
  late bool isDeleted;
  @Backlink(to: 'category')
  final products = IsarLinks<LocalProduct>();
}
