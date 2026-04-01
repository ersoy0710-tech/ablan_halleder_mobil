import 'dart:convert';

import 'package:ablan_halleder_mobil/enums/rol_enum.dart';

class UserModel {
  final String id;
  final RolEnum rol;
  final String adSoyad;
  final String email;
  final String phone;

  UserModel({required this.id, required this.rol, required this.adSoyad, required this.email, required this.phone});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    rol: RolEnum.values.firstWhere((element) => element.name == json["rol"]),
    adSoyad: json["adSoyad"],
    email: json["email"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "rol": rol.name,
    "adSoyad": adSoyad,
    "email": email,
    "phone": phone,
  };

  String toRawJson() => json.encode(toJson());
}