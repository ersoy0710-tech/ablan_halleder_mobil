import 'package:ablan_halleder_mobil/views/talep_olustur/talep_olustur_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class TalepOlusturView extends StatefulWidget {
  const TalepOlusturView({super.key});

  @override
  State<TalepOlusturView> createState() => _TalepOlusturViewState();
}

class _TalepOlusturViewState extends State<TalepOlusturView> {
  final TalepOlusturViewModel viewModel = TalepOlusturViewModel();

  final Color primaryTurquoise = const Color(0xFF149382);
  final Color darkBlue = const Color(0xFF122333);
  final Color greyText = const Color(0xFF707D89);

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
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: darkBlue),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Talep Oluştur",
          style: TextStyle(color: darkBlue, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Adım: Hizmet Detayları",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: darkBlue),
            ),
            const SizedBox(height: 8),
            Text(
              "İhtiyacınız olan hizmetin detaylarını giriniz.",
              style: TextStyle(color: greyText),
            ),
            const SizedBox(height: 32),

            _buildLabel("Hizmet Başlığı"),
            _buildTextField(
                hint: "Örn: Salon Temizliği",
                icon: Icons.title,
                textEditingController: viewModel.baslikTextEditingController
            ),

            _buildLabel("Açıklama"),
            _buildTextField(
              hint: "Detayları buraya yazınız...",
              icon: Icons.description,
              maxLines: 3,
              textEditingController: viewModel.aciklamaTextEditingController
            ),

            _buildLabel("Hizmet Verilecek Adres"),
            Observer(
              builder: (context) {
                return _buildCardWrapper(
                  child: DropdownButtonFormField<String>(
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.location_on_outlined, color: primaryTurquoise),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    hint: const Text("Kayıtlı bir adres seçin"),
                    items: viewModel.adresModelList.map((addr) {
                      return DropdownMenuItem<String>(
                        value: addr.id,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(addr.baslik, style: TextStyle(fontWeight: FontWeight.bold, color: darkBlue, fontSize: 14)),
                            Text(addr.adres, style: const TextStyle(color: Colors.grey, fontSize: 12), overflow: TextOverflow.ellipsis),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: viewModel.adresSec,
                    selectedItemBuilder: (BuildContext context) {
                      return viewModel.adresModelList.map<Widget>((addr) {
                        return Text(
                          addr.baslik,
                          style: TextStyle(color: darkBlue, fontWeight: FontWeight.w500),
                        );
                      }).toList();
                    },
                  ),
                );
              },
            ),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel("Alan (m²)"),
                      _buildTextField(
                        hint: "120",
                        icon: Icons.square_foot,
                        keyboardType: TextInputType.number,
                        textEditingController: viewModel.alanTextEditingController
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Observer(
                  builder: (context) {
                    return Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel("Evcil Hayvan?"),
                          _buildCardWrapper(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(viewModel.petVarMi ? "Var" : "Yok"),
                                Switch(
                                  value: viewModel.petVarMi,
                                  activeColor: primaryTurquoise,
                                  onChanged: viewModel.petVarMiDegistir,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),

            _buildLabel("Planlanan Tarih ve Saat"),
            Observer(
              builder: (context) {
                return _buildCardWrapper(
                  child: ListTile(
                    leading: const Icon(Icons.calendar_today, color: Colors.grey),
                    title: Text(
                      viewModel.planlananTarih == null
                          ? "Tarih Seçiniz"
                          : viewModel.planlananTarih.toString().substring(0, 16),
                    ),
                    onTap: () async {
                      DateTime? secilenTarih = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2027),
                      );
                      if (secilenTarih != null) {
                        viewModel.planlananTarihDegistir(secilenTarih);
                      }
                    },
                  ),
                );
              },
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryTurquoise,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 4,
                ),
                onPressed: () {
                  viewModel.talepOlustur();
                },
                child: Text(
                  "Talebi Oluştur",
                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8, left: 4),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w600, color: darkBlue),
      ),
    );
  }

  Widget _buildCardWrapper({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildTextField({
    required String hint,
    required IconData icon,
    required TextEditingController textEditingController,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return _buildCardWrapper(
      child: TextField(
        controller: textEditingController,
        maxLines: maxLines,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
          prefixIcon: Icon(icon, color: Colors.grey.shade400),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        ),
      ),
    );
  }
}
