import 'package:ablan_halleder_mobil/views/rol_sec/rol_sec_view.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store {
  void init(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const RolSecView()),
      (route) => false,
    );
  }

  double dynamicWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double dynamicHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
