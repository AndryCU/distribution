import 'package:distribution/features/crud_employeed/domain/entities/employed.dart';

import '../../domain/entities/local_db_entity.dart';

class RemoteEmployedModel extends Employed {
  RemoteEmployedModel(
      {required int id,
      required String fullName,
      required String residence,
      required int numberChildren,
      required String gender,
      required String catEmp,
      required bool isDeleted})
      : super(
            id: id,
            catEmp: catEmp,
            fullName: fullName,
            gender: gender,
            numberChildren: numberChildren,
            residence: residence,
            isDeleted: isDeleted);

  factory RemoteEmployedModel.fromJson(Map<String, dynamic> data) {
    final id = data['id'] as int;
    final name = data['fullName'] as String;
    final residence = data['residence'] as String;
    final children = data['numberChildren'] as int;
    final gender = data['gender'] as String;
    final cat = data['catEmp'] as String;
    final isDeleted = data['isDeleted'] as bool;
    return RemoteEmployedModel(
        id: id,
        catEmp: cat,
        fullName: name,
        gender: gender,
        numberChildren: children,
        residence: residence,
        isDeleted: isDeleted);
  }

  factory RemoteEmployedModel.fromEmployed(EmployedLocal employed) {
    return RemoteEmployedModel(
        id: employed.id,
        fullName: employed.fullName,
        residence: employed.residence,
        numberChildren: employed.numberChildren,
        gender: employed.gender,
        catEmp: employed.catEmp,
        isDeleted: employed.isDeleted);
  }

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'residence': residence,
        'numberChildren': numberChildren,
        'gender': gender,
        'catEmp': catEmp,
      };
}
