// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:ablan_halleder_mobil/views/kayit_ol/kayit_ol_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ablan_halleder_mobil/main.dart';

void main() {
  late KayitOlViewModel vm;

  setUp(() {
    vm = KayitOlViewModel();
  });


  test("rol seçilirse kayıt yapılır", () {
    vm.sifre = "1234";
    vm.sifreTekrar = "1234";
    vm.adSoyad = "vedat";
    vm.telefon = "5551234567";

    expect(() => vm.kayitOl(1), returnsNormally);
  });
}
