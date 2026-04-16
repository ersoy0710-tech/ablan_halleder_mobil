class IlModel {
  final int id;
  final String il;

  IlModel({required this.id, required this.il});

  factory IlModel.fromJson(Map<String, dynamic> json) => IlModel(
    id: json["id"],
    il: json["il"]
  );
}