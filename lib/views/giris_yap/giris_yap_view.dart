import 'package:ablan_halleder_mobil/views/giris_yap/giris_yap_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class GirisYapView extends StatefulWidget {
  const GirisYapView({super.key});

  @override
  State<GirisYapView> createState() => _GirisYapViewState();
}

class _GirisYapViewState extends State<GirisYapView> {
  final GirisYapViewModel viewModel = GirisYapViewModel();

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
        title: Text("Giriş Yap", style: TextStyle(color: darkBlue, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hoş Geldiniz", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: darkBlue)),
            const SizedBox(height: 12),
            Text("Hizmetlere ulaşmak veya yönetmek için lütfen giriş yapın.", style: TextStyle(fontSize: 16, color: greyText)),
            const SizedBox(height: 40),

            _buildInputLabel("E-posta"),
            _buildCustomTextField(controller: viewModel.emailController, hint: "ornek@eposta.com", icon: Icons.mail_outline),

            const SizedBox(height: 20),

            _buildInputLabel("Şifre"),
            _buildCustomTextField(controller: viewModel.sifreController, hint: ".........", icon: Icons.lock_outline, isPassword: true),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryTurquoise,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 4,
                ),
                onPressed: () async {
                  await viewModel.girisYap(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Giriş Yap", style: TextStyle(fontSize: 18, color: Colors.white)),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(label, style: TextStyle(fontWeight: FontWeight.w600, color: darkBlue)),
    );
  }

  Widget _buildCustomTextField({required TextEditingController controller, required String hint, required IconData icon, bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade400),
          prefixIcon: Icon(icon, color: Colors.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
        ),
      ),
    );
  }
}
