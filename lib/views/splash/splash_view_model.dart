import 'package:ablan_halleder_mobil/manager/locale_manager.dart';
import 'package:ablan_halleder_mobil/views/ana_sayfa/ana_sayfa_view.dart';
import 'package:ablan_halleder_mobil/views/base/base_view.dart';
import 'package:ablan_halleder_mobil/views/rol_sec/rol_sec_view.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store {
  void init(BuildContext context) {
    kullaniciKontrol(context);
  }

  Future<void> kullaniciKontrol(BuildContext context) async {
    final locale = LocaleManager();
    String? userString = await locale.getString("user");

    if (!context.mounted) return;

    if (userString == null) {
      Navigator.pushNamedAndRemoveUntil(context, '/rol_sec', (route) => false);
    }
    else {
      Navigator.pushNamedAndRemoveUntil(context, '/base', (route) => false);
    }
  }

  double dynamicWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double dynamicHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
