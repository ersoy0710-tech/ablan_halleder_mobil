import 'package:ablan_halleder_mobil/views/ana_sayfa/ana_sayfa_view.dart';
import 'package:ablan_halleder_mobil/views/profil/profil_view.dart';
import 'package:ablan_halleder_mobil/views/taleplerim/taleplerim_view.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'base_view_model.g.dart';

class BaseViewModel = _BaseViewModelBase with _$BaseViewModel;

abstract class _BaseViewModelBase with Store {

  @observable
  int seciliSayfa = 0;

  final List<Widget> views = [
    const AnaSayfaView(),
    const TaleplerimView(),
    const Center(child: Text("Mesajlar")),
    const ProfilView(),
  ];

  final List<NavItemModel> navItems = [
    NavItemModel(title: "Ana Sayfa", icon: Icons.home_filled),
    NavItemModel(title: "Taleplerim", icon: Icons.assignment_outlined),
    NavItemModel(title: "Mesajlar", icon: Icons.chat_bubble_outline),
    NavItemModel(title: "Profil", icon: Icons.person_outline),
  ];

  void init() {}

  @action
  void sayfaDegistir(int index) {
    seciliSayfa = index;
  }

  double dynamicWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double dynamicHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}

class NavItemModel {
  final String title;
  final IconData icon;

  NavItemModel({required this.title, required this.icon});
}
