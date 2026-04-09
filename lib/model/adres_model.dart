class AdresModel {
  final String id;
  final String baslik;
  final String adres;

  AdresModel({required this.id, required this.baslik, required this.adres});

  factory AdresModel.fromJson(Map<String, dynamic> json) => AdresModel(
    id: json["id"],
    baslik: json["baslik"],
    adres: json["adres"],
  );
}