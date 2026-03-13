import 'package:ablan_halleder_mobil/views/rol_sec/rol_sec_view_model.dart';
import 'package:flutter/material.dart';

class RolSecView extends StatefulWidget {
  const RolSecView({super.key});

  @override
  State<RolSecView> createState() => _RolSecViewState();
}

class _RolSecViewState extends State<RolSecView> {
  final RolSecViewModel viewModel = RolSecViewModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(width: 100, height: 100, color: Colors.green, alignment: Alignment.center, child: Text("ICON")),

                SizedBox(height: 16),

                Text("Uygulamaya Hoş Geldiniz", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
