import 'dart:convert';

import 'package:ablan_halleder_mobil/manager/locale_manager.dart';
import 'package:ablan_halleder_mobil/model/adres_model.dart';
import 'package:ablan_halleder_mobil/model/user_model.dart';
import 'package:ablan_halleder_mobil/service/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'adreslerim_view_model.g.dart';

class AdreslerimViewModel = _AdreslerimViewModelBase with _$AdreslerimViewModel;

abstract class _AdreslerimViewModelBase with Store {
  final DioService _dio = DioService();

  @observable
  bool? success;

  @observable
  String? message;

  @observable
  ObservableList<AdresModel> adresModelList = ObservableList();

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

  @action
  Future<bool> adresSil(int index) async {
    try {
      final locale = LocaleManager();
      String? userString = await locale.getString("user");

      if(userString == null) return false;

      final userModel = UserModel.fromJson(json.decode(userString));

      String adresId = adresModelList[index].id;

      Response response = await _dio.dio.delete(
          "/adres_sil",
          data: {
            "musteriId": userModel.id,
            "adresId": adresId,
          }
      );

      print(response);

      if(response.data["success"]) {
        adresModelList.removeAt(index);
        return true;
      }
      else {
        return false;
      }
    }
    on DioException catch (error) {
      Response response = await _dio.dioError(error);
      success = false;
      message = response.data["message"];
      return false;
    }
  }

  void goAdresEkleView(BuildContext context) {
    Navigator.pushNamed(context, '/adres_ekle');
  }
}