import 'package:ablan_halleder_mobil/manager/locale_manager.dart';
import 'package:ablan_halleder_mobil/model/user_model.dart';
import 'package:ablan_halleder_mobil/service/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'giris_yap_view_model.g.dart';

class GirisYapViewModel = _GirisYapViewModelBase with _$GirisYapViewModel;

abstract class _GirisYapViewModelBase with Store {
  TextEditingController emailController = TextEditingController();
  TextEditingController sifreController = TextEditingController();

  @observable
  bool? success;

  @observable
  String? message;

  final DioService _dio = DioService();

  void init() {}

  @action
  Future<void> girisYap(BuildContext context) async {
    try {
      if(!validate()) {
        return;
      }

      Response response = await _dio.dio.post(
          "/giris_yap",
          data: {
            "email": emailController.text,
            "sifre": sifreController.text,
          }
      );

      if(response.data["success"]) {
        final locale = LocaleManager();

        final userModel = UserModel.fromJson(response.data["data"]);
        await locale.saveString("user", userModel.toRawJson());

        if (!context.mounted) return;
        Navigator.pushNamedAndRemoveUntil(context, '/ana_sayfa', (route) => false);
      }
    }
    on DioException catch (error) {
      Response response = await _dio.dioError(error);
      success = false;
      message = response.data["message"];
    }
  }

  bool validate() {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(emailController.text)) {
      message = "Geçerli bir e-posta adresi giriniz.";
      success = false;
      return false;
    }

    if (sifreController.text.length < 8 || sifreController.text.length > 18) {
      message = "Şifre en az 8 en fazla 18 karakter olmalıdır.";
      success = false;
      return false;
    }

    return true;
  }


  double dynamicWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double dynamicHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
