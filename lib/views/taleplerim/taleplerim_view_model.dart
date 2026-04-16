import 'dart:convert';

import 'package:ablan_halleder_mobil/manager/locale_manager.dart';
import 'package:ablan_halleder_mobil/model/talep_model.dart';
import 'package:ablan_halleder_mobil/model/user_model.dart';
import 'package:ablan_halleder_mobil/service/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

part 'taleplerim_view_model.g.dart';

class TaleplerimViewModel = _TaleplerimViewModelBase with _$TaleplerimViewModel;

abstract class _TaleplerimViewModelBase with Store {
  final DioService _dio = DioService();

  @observable
  bool? success;

  @observable
  String? message;

  @observable
  ObservableList<TalepModel> talepModelList = ObservableList();

  void init() {
    taleplerim();
  }

  @action
  Future<void> taleplerim() async {
    final locale = LocaleManager();
    String? userString = await locale.getString("user");

    if(userString == null) return;
    final userModel = UserModel.fromJson(json.decode(userString));

    Response response = await _dio.dio.post(
        "/taleplerim",
        data: {
          "musteriId": userModel.id
        }
    );

    if(response.data["success"]) {
      final data = response.data["data"] as List<dynamic>;
      for (var adres in data) {
        talepModelList.add(TalepModel.fromJson(adres));
      }
    }
  }
}