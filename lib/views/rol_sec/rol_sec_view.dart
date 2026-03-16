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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 50),

                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      image: DecorationImage(image: AssetImage("assets/icons/launcher_icon.png")),
                    ),
                  ),

                  SizedBox(height: 16),

                  Text(
                    "Uygulamaya Hoş Geldiniz",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 8),

                  Text(
                    "Lütfen aşağıdan istediğiniz rolü seçiniz.",
                    style: TextStyle(fontSize: 14, color: Colors.black45),
                  ),

                  const SizedBox(height: 40),

                  roleCard(
                    index: 0,
                    title: "Hizmet Almak İstiyorum",
                    desc: "Ev temizliği talebi oluştur, takip et.",
                    icon: Icons.home,
                    viewModel: viewModel,
                  ),

                  roleCard(
                    index: 1,
                    title: "Hizmet Vermek İstiyorum",
                    desc: "Uygun işleri gör, kabul et, tamamla.",
                    icon: Icons.person,
                    viewModel: viewModel,
                  ),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        viewModel.goKayitOl(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                      child: Text(
                        "Devam Et",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Zaten hesabınız var mı? "),
                      Text(
                        "Giriş Yap",
                        style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget roleCard({
    required int index,
    required String title,
    required String desc,
    required IconData icon,
    required RolSecViewModel viewModel,
  }) {
    bool isSelected = viewModel.secilenRol == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          viewModel.secilenRol = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300, width: 2),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 4),
                  Text(desc, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),

            Icon(
              isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isSelected ? Colors.teal : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
