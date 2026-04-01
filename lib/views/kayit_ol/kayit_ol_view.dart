import 'package:ablan_halleder_mobil/enums/rol_enum.dart';
import 'package:ablan_halleder_mobil/views/kayit_ol/kayit_ol_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

class KayitOlView extends StatefulWidget {
  const KayitOlView({super.key});

  @override
  State<KayitOlView> createState() => _KayitOlViewState();
}

class _KayitOlViewState extends State<KayitOlView> {
  late RolEnum secilenRol;
  final KayitOlViewModel viewModel = KayitOlViewModel();

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
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    secilenRol = ModalRoute.of(context)!.settings.arguments as RolEnum;
  }

  final Color primaryTurquoise = const Color(0xFF149382);
  final Color darkBlue = const Color(0xFF122333);
  final Color greyText = const Color(0xFF707D89);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Hesap Oluştur",
          style: TextStyle(color: darkBlue, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Aramıza Katıl",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: darkBlue),
              ),
              const SizedBox(height: 8),
              Text(
                "Lütfen bilgilerinizi eksiksiz doldurarak kaydınızı tamamlayın.",
                style: TextStyle(fontSize: 15, color: greyText),
              ),
              const SizedBox(height: 30),

              // --- Inputlar ---
              _buildInputLabel("Ad Soyad"),
              _buildCustomTextField(
                controller: viewModel.adSoyadController,
                hint: "Adınız ve Soyadınız",
                icon: Icons.person_outline,
              ),

              _buildInputLabel("E-posta Adresi"),
              _buildCustomTextField(
                controller: viewModel.emailController,
                hint: "ornek@mail.com",
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),

              _buildInputLabel("Telefon Numarası"),
              _buildCustomTextField(
                controller: viewModel.telefonController,
                hint: "5XXXXXXXXX",
                icon: Icons.phone_android_outlined,
                keyboardType: TextInputType.phone,
                formatters: [LengthLimitingTextInputFormatter(10)],
              ),

              _buildInputLabel("Şifre"),
              _buildCustomTextField(
                controller: viewModel.sifreController,
                hint: "********",
                icon: Icons.lock_outline,
                isPassword: true,
              ),

              _buildInputLabel("Şifre Tekrar"),
              _buildCustomTextField(
                controller: viewModel.sifreTekrarController,
                hint: "********",
                icon: Icons.lock_reset_outlined,
                isPassword: true,
              ),

              const SizedBox(height: 20),

              // --- Seçilen Rol Göstergesi (Modern Kart) ---
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: primaryTurquoise),
                    const SizedBox(width: 12),
                    Text(
                      "Kayıt Rolü: ",
                      style: TextStyle(color: darkBlue, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      secilenRol == RolEnum.customer ? "Hizmet Alan" : "Hizmet Veren",
                      style: TextStyle(color: primaryTurquoise, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // --- Kayıt Butonu ---
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () => viewModel.kayitOl(secilenRol),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryTurquoise,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Kaydı Tamamla",
                        style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.check_circle_outline, color: Colors.white),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8, top: 16),
      child: Text(label, style: TextStyle(fontWeight: FontWeight.w600, color: darkBlue)),
    );
  }

  Widget _buildCustomTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? formatters,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        inputFormatters: formatters,
        style: TextStyle(color: darkBlue),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
          prefixIcon: Icon(icon, color: Colors.grey.shade400, size: 22),
          suffixIcon: isPassword ? Icon(Icons.remove_red_eye_outlined, color: Colors.grey.shade400) : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
        ),
      ),
    );
  }
}
