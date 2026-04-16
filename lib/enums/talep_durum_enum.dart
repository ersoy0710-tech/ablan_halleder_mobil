import 'package:flutter/material.dart';

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
      case TalepDurum.draft:
        return 'Taslak';
      case TalepDurum.published:
        return 'Yayınlandı';
      case TalepDurum.assigned:
        return 'Atandı';
      case TalepDurum.inProgress:
        return 'Devam Ediyor';
      case TalepDurum.awaitingApproval:
        return 'Onay Bekliyor';
      case TalepDurum.completed:
        return 'Tamamlandı';
      case TalepDurum.canceled:
        return 'İptal Edildi';
    }
  }

  Color get color {
    switch (this) {
      case TalepDurum.draft:
        return Colors.grey;
      case TalepDurum.published:
        return Colors.blue;
      case TalepDurum.assigned:
        return Colors.orange;
      case TalepDurum.inProgress:
        return Colors.teal;
      case TalepDurum.awaitingApproval:
        return Colors.amber;
      case TalepDurum.completed:
        return Colors.green;
      case TalepDurum.canceled:
        return Colors.red;
    }
  }

  static TalepDurum fromString(String value) {
    return TalepDurum.values.firstWhere(
      (element) => element.value == value,
      orElse: () => TalepDurum.draft,
    );
  }
}
