import 'dart:convert';

import 'package:ablan_halleder_mobil/manager/locale_manager.dart';
import 'package:ablan_halleder_mobil/model/il_model.dart';
import 'package:ablan_halleder_mobil/model/ilce_model.dart';
import 'package:ablan_halleder_mobil/model/user_model.dart';
import 'package:ablan_halleder_mobil/service/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'adres_ekle_view_model.g.dart';

class AdresEkleViewModel = _AdresEkleViewModelBase with _$AdresEkleViewModel;

abstract class _AdresEkleViewModelBase with Store {
  final DioService _dio = DioService();

  @observable
  IlModel? secilenIl;

  @observable
  ObservableList<IlModel> ilModelList = ObservableList();


  @observable
  IlceModel? secilenIlce;

  @observable
  ObservableList<IlceModel> ilceModelList = ObservableList();


  @observable
  bool? success;

  @observable
  String? message;

  TextEditingController baslikController = TextEditingController();
  TextEditingController adresController = TextEditingController();

  void init() {
    ilGetir();
  }

  Future<void> ilGetir() async {
    Response response = await _dio.dio.post("/iller");
    if(response.data["success"]) {
      final data = response.data["data"] as List<dynamic>;
      for (var il in data) {
        ilModelList.add(IlModel.fromJson(il));
      }
    }
  }

  Future<void> ilceGetir() async {
    if (secilenIl == null) return;

    Response response = await _dio.dio.post(
        "/ilceler",
        data: {
          "ilId": secilenIl?.id
        }
    );

    if(response.data["success"]) {
      final data = response.data["data"] as List<dynamic>;
      for (var ilce in data) {
        ilceModelList.add(IlceModel.fromJson(ilce));
      }
    }
  }

  @action
  void ilSec(IlModel? il) {
    secilenIl = il;
    secilenIlce = null;
    ilceModelList.clear();
    if (il != null) {
      ilceGetir();
    }
  }

  @action
  void ilceSec(IlceModel? ilce) {
    secilenIlce = ilce;
  }

  @action
  Future<void> adresEkle() async {
    try {
      if (!validate()) return;

      final locale = LocaleManager();
      String? userString = await locale.getString("user");

      if(userString == null) return;

      final userModel = UserModel.fromJson(json.decode(userString));

      Response response = await _dio.dio.post(
          "/adres_ekle",
          data: {
            "musteriId": userModel.id,
            "baslik": baslikController.text,
            "adres": adresController.text,
            "ilId": secilenIl?.id,
            "ilceId": secilenIlce?.id,
          }
      );

      if(response.data["success"]) {
        success = true;
        message = "Adres eklendi.";
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
    if (baslikController.text.trim().isEmpty) {
      message = "Başlık alanı zorunludur.";
      success = false;
      return false;
    }

    if (adresController.text.trim().isEmpty) {
      message = "Adres alanı zorunludur.";
      success = false;
      return false;
    }

    if (secilenIl == null) {
      message = "İl alanı zorunludur.";
      success = false;
      return false;
    }

    if (secilenIlce == null) {
      message = "İlçe alanı zorunludur";
      success = false;
      return false;
    }

    return true;
  }
}