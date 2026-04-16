import 'package:ablan_halleder_mobil/model/il_model.dart';
import 'package:ablan_halleder_mobil/model/ilce_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'adres_ekle_view_model.dart';

class AdresEkleView extends StatefulWidget {
  const AdresEkleView({super.key});

  @override
  State<AdresEkleView> createState() => _AdresEkleViewState();
}

class _AdresEkleViewState extends State<AdresEkleView> {
  final AdresEkleViewModel viewModel = AdresEkleViewModel();

  final Color primaryTurquoise = const Color(0xFF149382);
  final Color darkBlue = const Color(0xFF122333);

  late ReactionDisposer _disposer;

  @override
  void initState() {
    super.initState();
    _disposer = reaction(
          (_) => viewModel.message,
          (String? msg) {
        if (msg != null && msg.isNotEmpty) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(msg)),
          );
          viewModel.message = null;
        }
      },
    );

    viewModel.init();
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Yeni Adres Ekle", style: TextStyle(color: darkBlue, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: darkBlue),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Adres Başlığı"),
            _buildTextField(
              controller: viewModel.baslikController,
              hint: "Ev, İş, Annemlerin Evi vb.",
              icon: Icons.label_outline,
            ),

            const SizedBox(height: 20),
            _buildSectionTitle("Şehir ve İlçe"),
            Observer(
              builder: (context) {
                return Row(
                  children: [
                    Expanded(
                      child: _buildDropdownField<IlModel>(
                        hint: "Şehir Seç",
                        value: viewModel.secilenIl,
                        items: viewModel.ilModelList.map((il) {
                          return DropdownMenuItem(value: il, child: Text(il.il));
                        }).toList(),
                        onChanged: (val) => viewModel.ilSec(val),
                        icon: Icons.location_city,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: _buildDropdownField<IlceModel>(
                        hint: "İlçe Seç",
                        value: viewModel.secilenIlce,
                        items: viewModel.ilceModelList.map((ilce) {
                          return DropdownMenuItem(value: ilce, child: Text(ilce.ilce));
                        }).toList(),
                        onChanged: (val) => viewModel.ilceSec(val),
                        icon: Icons.map_outlined,
                      ),
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 20),
            _buildSectionTitle("Tam Adres"),
            _buildTextField(
              controller: viewModel.adresController,
              hint: "Sokak, Mahalle, Bina No, Kapı No...",
              icon: Icons.home_outlined,
              maxLines: 4,
            ),

            const SizedBox(height: 40),
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4),
      child: Text(
        title,
        style: TextStyle(color: darkBlue.withOpacity(0.7), fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          prefixIcon: Icon(icon, color: primaryTurquoise, size: 20),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }

  Widget _buildDropdownField<T>({
    required String hint,
    required T? value,
    required List<DropdownMenuItem<T>> items,
    required ValueChanged<T?> onChanged,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          hint: Text(hint, style: const TextStyle(color: Colors.grey, fontSize: 14)),
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down, color: primaryTurquoise),
          items: items,
          onChanged: onChanged,
          //prefixIcon: Icon(icon, color: primaryTurquoise, size: 20), // Standart DropdownButton'da prefixIcon yoktur, aşağıda özel ekledik
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: () => viewModel.adresEkle(),
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryTurquoise,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 0,
        ),
        child: const Text(
          "Adresi Kaydet",
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}