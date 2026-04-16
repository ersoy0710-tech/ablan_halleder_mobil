import 'dart:convert';

import 'package:ablan_halleder_mobil/manager/locale_manager.dart';
import 'package:ablan_halleder_mobil/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'profil_view_model.g.dart';

class ProfilViewModel = _ProfilViewModelBase with _$ProfilViewModel;

abstract class _ProfilViewModelBase with Store {
  @observable
  UserModel? userModel;

  void init(BuildContext context) {
    kullaniciGetir(context);
  }

  @action
  Future<void> kullaniciGetir(BuildContext context) async {
    final locale = LocaleManager();
    String? userString = await locale.getString("user");

    if (!context.mounted) return;
    if (userString == null) return;
    userModel = UserModel.fromJson(jsonDecode(userString));
  }

  void goAdreslerimView(BuildContext context) {
    Navigator.pushNamed(context, '/adreslerim');
  }

  double dynamicWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double dynamicHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
