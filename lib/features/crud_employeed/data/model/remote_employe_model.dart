import 'package:distribution/features/crud_employeed/domain/entities/employed.dart';

import '../../domain/entities/local_db_entity.dart';

class RemoteEmployedModel extends Employed {
  RemoteEmployedModel(
      {required int id,
      required int version,
      required String fullName,
      required String residence,
      required int numberChildren,
      required String gender,
      required String catEmp,
      required bool isDeleted})
      : super(
            id: id,
            version: version,
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
    final version = data['version'] as int;
    return RemoteEmployedModel(
        id: id,
        version: version,
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
        version: employed.version,
        fullName: employed.fullName,
        residence: employed.residence,
        numberChildren: employed.numberChildren,
        gender: employed.gender,
        catEmp: employed.catEmp,
        isDeleted: employed.isDeleted);
  }

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'version': version,
        'residence': residence,
        'numberChildren': numberChildren,
        'gender': gender,
        'catEmp': catEmp,
      };

  RemoteEmployedModel copyWith({required int id}) {
    return RemoteEmployedModel(
        id: id,
        version: version!,
        fullName: fullName,
        residence: residence,
        numberChildren: numberChildren,
        gender: gender,
        catEmp: catEmp,
        isDeleted: isDeleted);
  }
}
