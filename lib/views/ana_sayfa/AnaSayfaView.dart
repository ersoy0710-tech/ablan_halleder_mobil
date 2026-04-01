import 'package:flutter/material.dart';

class AnaSayfaView extends StatefulWidget {
  const AnaSayfaView({super.key});

  @override
  State<AnaSayfaView> createState() => _AnaSayfaViewState();
}

class _AnaSayfaViewState extends State<AnaSayfaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Ana Sayfa"
        ),
      ),
    );
  }
}
