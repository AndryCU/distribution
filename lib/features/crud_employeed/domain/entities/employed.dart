class Employed {
  final String fullName, residence, gender, catEmp;
  final int numberChildren, id;
  final bool isDeleted;
  int? version;

  Employed(
      {required this.id,
      required this.version,
      required this.fullName,
      required this.residence,
      required this.numberChildren,
      required this.gender,
      required this.catEmp,
      required this.isDeleted});
}
