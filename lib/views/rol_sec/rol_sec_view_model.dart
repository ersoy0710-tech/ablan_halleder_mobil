import 'package:ablan_halleder_mobil/enums/rol_enum.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'rol_sec_view_model.g.dart';

class RolSecViewModel = _RolSecViewModelBase with _$RolSecViewModel;

abstract class _RolSecViewModelBase with Store {
  // 0: Hizmet almak, 1: Hizmet vermek
  RolEnum? secilenRol;

  void init() {}

  void goKayitOl(BuildContext context) {
    if(secilenRol == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Lütfen rol seçin", textAlign: TextAlign.center),
        ),
      );
      return;
    }
    Navigator.pushNamed(context, '/kayit_ol', arguments: secilenRol);
  }

  void goGirisYap(BuildContext context) {
    Navigator.pushNamed(context, '/giris_yap');
  }

  double dynamicWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double dynamicHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
