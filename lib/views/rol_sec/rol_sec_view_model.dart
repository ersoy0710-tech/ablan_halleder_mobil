import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'rol_sec_view_model.g.dart';

class RolSecViewModel = _RolSecViewModelBase with _$RolSecViewModel;

abstract class _RolSecViewModelBase with Store {

  void init(BuildContext context) {

  }

  double dynamicWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double dynamicHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}