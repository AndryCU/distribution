import 'package:isar/isar.dart';
part 'isar_category_entity.g.dart';

@collection
@Name('catproduct')
class CategoryLocal {
  late Id id;
  late String name_cat;
  late int version;
  late bool isDeleted;
}
