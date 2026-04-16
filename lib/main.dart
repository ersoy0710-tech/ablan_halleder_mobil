import 'package:ablan_halleder_mobil/views/adres_ekle_view/adres_ekle_view.dart';
import 'package:ablan_halleder_mobil/views/adreslerim/adreslerim_view.dart';
import 'package:ablan_halleder_mobil/views/base/base_view.dart';
import 'package:ablan_halleder_mobil/views/giris_yap/giris_yap_view.dart';
import 'package:ablan_halleder_mobil/views/kayit_ol/kayit_ol_view.dart';
import 'package:ablan_halleder_mobil/views/rol_sec/rol_sec_view.dart';
import 'package:ablan_halleder_mobil/views/splash/splash_view.dart';
import 'package:ablan_halleder_mobil/views/talep_olustur/talep_olustur_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ablan Halleder',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashView(),
        '/rol_sec': (context) => const RolSecView(),
        '/kayit_ol': (context) => const KayitOlView(),
        '/giris_yap': (context) => const GirisYapView(),
        '/base': (context) => const BaseView(),
        '/talep_olustur': (context) => const TalepOlusturView(),
        '/adreslerim': (context) => const AdreslerimView(),
        '/adres_ekle': (context) => const AdresEkleView(),
      },
    );
  }
}
