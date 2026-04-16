import 'package:flutter/material.dart';

class TalepModel {
  final String talepId;
  final String baslik;
  final String aciklama;
  final int alan;
  final bool hayvanVarMi;
  final String planlananTarih;
  final TalepDurum durum;

  TalepModel({
    required this.talepId,
    required this.baslik,
    required this.aciklama,
    required this.alan,
    required this.hayvanVarMi,
    required this.planlananTarih,
    required this.durum,
  });

  factory TalepModel.fromJson(Map<String, dynamic> json) => TalepModel(
    talepId: json["talepId"],
    baslik: json["baslik"],
    aciklama: json["aciklama"],
    alan: json["alan"],
    hayvanVarMi: json["hayvanVarMi"],
    planlananTarih: _tarihFormatla(json["planlananTarih"]),
    durum: TalepDurum.fromString(json["durum"])
  );

  static String _tarihFormatla(String? tarihStr) {
    if (tarihStr == null || tarihStr.isEmpty) return "";
    try {
      DateTime dt = DateTime.parse(tarihStr).toLocal();
      List<String> aylar = [
        "Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran",
        "Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık"
      ];

      String gun = dt.day.toString().padLeft(2, '0');
      String ay = aylar[dt.month - 1];
      String yil = dt.year.toString();

      return "$gun $ay $yil";
    } catch (e) {
      return tarihStr;
    }
  }
}

enum TalepDurum {
  draft('draft'),
  published('published'),
  assigned('assigned'),
  inProgress('in_progress'),
  awaitingApproval('awaiting_approval'),
  completed('completed'),
  canceled('canceled');

  final String value;
  const TalepDurum(this.value);

  String get tr {
    switch (this) {
      case TalepDurum.draft: return 'Taslak';
      case TalepDurum.published: return 'Yayınlandı';
      case TalepDurum.assigned: return 'Atandı';
      case TalepDurum.inProgress: return 'Devam Ediyor';
      case TalepDurum.awaitingApproval: return 'Onay Bekliyor';
      case TalepDurum.completed: return 'Tamamlandı';
      case TalepDurum.canceled: return 'İptal Edildi';
    }
  }

  Color get color {
    switch (this) {
      case TalepDurum.draft: return Colors.grey;
      case TalepDurum.published: return Colors.blue;
      case TalepDurum.assigned: return Colors.orange;
      case TalepDurum.inProgress: return Colors.teal;
      case TalepDurum.awaitingApproval: return Colors.amber;
      case TalepDurum.completed: return Colors.green;
      case TalepDurum.canceled: return Colors.red;
    }
  }

  static TalepDurum fromString(String value) {
    return TalepDurum.values.firstWhere(
          (element) => element.value == value,
      orElse: () => TalepDurum.draft,
    );
  }
}

/*
talepId: item.id,
baslik: item.title,
hayvanVarMi: item.has_pets,
planlananTarih: item.scheduled_start,
durum: item.status
*/