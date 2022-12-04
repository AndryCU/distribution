import 'package:isar/isar.dart';

part 'local_db_entity.g.dart';

@collection
@Name("employed")
class EmployedLocal {
  late Id id;
  late String fullName;
  late String residence;
  late int numberChildren;
  late String gender;
  late String catEmp;
  late bool isDeleted;
}
