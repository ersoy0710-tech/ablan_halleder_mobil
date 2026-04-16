class IlceModel {
  final int id;
  final String ilce;

  IlceModel({required this.id, required this.ilce});

  factory IlceModel.fromJson(Map<String, dynamic> json) => IlceModel(
      id: json["id"],
      ilce: json["ilce"]
  );
}