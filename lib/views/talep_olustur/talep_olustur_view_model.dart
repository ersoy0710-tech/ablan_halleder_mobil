import 'dart:convert';

import 'package:ablan_halleder_mobil/manager/locale_manager.dart';
import 'package:ablan_halleder_mobil/model/adres_model.dart';
import 'package:ablan_halleder_mobil/model/user_model.dart';
import 'package:ablan_halleder_mobil/service/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'talep_olustur_view_model.g.dart';

class TalepOlusturViewModel = _TalepOlusturViewModelBase with _$TalepOlusturViewModel;

abstract class _TalepOlusturViewModelBase with Store {
  final DioService _dio = DioService();

  TextEditingController baslikTextEditingController = TextEditingController();
  TextEditingController aciklamaTextEditingController = TextEditingController();
  TextEditingController alanTextEditingController = TextEditingController();

  @observable
  AdresModel? secilenAdres;

  @observable
  ObservableList<AdresModel> adresModelList = ObservableList();

  @observable
  bool petVarMi = false;

  @observable
  DateTime? planlananTarih;

  @observable
  bool? success;

  @observable
  String? message;

  void init() {
    adreslerim();
  }

  @action
  Future<void> adreslerim() async {
    final locale = LocaleManager();
    String? userString = await locale.getString("user");

    if(userString == null) return;

    final userModel = UserModel.fromJson(json.decode(userString));

    Response response = await _dio.dio.post(
        "/adreslerim",
        data: {
          "musteriId": userModel.id
        }
    );

    if(response.data["success"]) {
      final data = response.data["data"] as List<dynamic>;
      for (var adres in data) {
        adresModelList.add(AdresModel.fromJson(adres));
      }
    }
  }

  Future<void> talepOlustur() async {
    try {
      if (!validate()) return;

      final locale = LocaleManager();
      String? userString = await locale.getString("user");

      if(userString == null) return;

      final userModel = UserModel.fromJson(json.decode(userString));

      Response response = await _dio.dio.post(
          "/talep_olustur",
          data: {
            "musteriId": userModel.id,
            "adresId": secilenAdres!.id,
            "baslik": baslikTextEditingController.text,
            "aciklama": aciklamaTextEditingController.text,
            "alan": alanTextEditingController.text,
            "petVarMi": petVarMi,
            "planlananTarih": planlananTarih!.toUtc().toIso8601String()
          }
      );

      if(response.data["success"]) {
        success = true;
        message = "Talep oluşturuldu.";
      }
      else {
        throw Exception();
      }
    }
    on DioException catch (error) {
      Response response = await _dio.dioError(error);
      success = false;
      message = response.data["message"];
    }
  }

  @action
  bool validate() {
    if (secilenAdres == null) {
      message = "Lütfen hizmetin verileceği adresi seçiniz.";
      success = false;
      return false;
    }

    if (baslikTextEditingController.text.trim().isEmpty) {
      message = "Lütfen talebiniz için bir başlık giriniz.";
      success = false;
      return false;
    }

    if (alanTextEditingController.text.trim().isEmpty) {
      message = "Lütfen temizlenecek alanın büyüklüğünü (m²) giriniz.";
      success = false;
      return false;
    }

    final alan = int.tryParse(alanTextEditingController.text);
    if (alan == null || alan <= 0) {
      message = "Geçerli bir alan (m²) değeri giriniz.";
      success = false;
      return false;
    }

    if (planlananTarih == null) {
      message = "Lütfen hizmetin başlayacağı tarihi seçiniz.";
      success = false;
      return false;
    }

    if (planlananTarih!.isBefore(DateTime.now())) {
      message = "Geçmiş bir tarihe talep oluşturamazsınız.";
      success = false;
      return false;
    }

    if (aciklamaTextEditingController.text.trim().length < 10) {
      message = "Lütfen hizmet detaylarını biraz daha açınız (min. 10 karakter).";
      success = false;
      return false;
    }

    return true;
  }

  @action
  void adresSec(String? val) {
    secilenAdres = adresModelList.firstWhere((element) => element.id == val);
  }

  @action
  void petVarMiDegistir(bool val) {
    petVarMi = val;
  }

  @action
  void planlananTarihDegistir(DateTime val) {
    planlananTarih = val;
  }

  double dynamicWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double dynamicHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
