import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'kayit_ol_view_model.g.dart';

class KayitOlViewModel = _KayitOlViewModelBase with _$KayitOlViewModel;

abstract class _KayitOlViewModelBase with Store {
  String adSoyad = "", telefon = "", sifre = "", sifreTekrar = "";

  void init(BuildContext context) {}

  void kayitOl(int secilenRol) {

  }


  double dynamicWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double dynamicHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
