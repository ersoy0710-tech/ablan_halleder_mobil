import 'package:ablan_halleder_mobil/views/profil/profil_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProfilView extends StatefulWidget {
  const ProfilView({super.key});

  @override
  State<ProfilView> createState() => _ProfilViewState();
}

class _ProfilViewState extends State<ProfilView> {
  final ProfilViewModel viewModel = ProfilViewModel();

  final Color primaryTurquoise = const Color(0xFF149382);
  final Color darkBlue = const Color(0xFF122333);
  final Color lightCardColor = const Color(0xFFF1F9F8);

  @override
  void initState() {
    super.initState();
    viewModel.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Observer(
            builder: (context) {
              return _buildProfileHeader();
            },
          ),
          const SizedBox(height: 30),
          _buildMenuSection(),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: lightCardColor,
          child: Icon(Icons.person, size: 50, color: primaryTurquoise),
        ),
        const SizedBox(height: 15),
        Text(
          viewModel.userModel?.adSoyad ?? "",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: darkBlue),
        ),
        Text(
          viewModel.userModel?.email ?? "",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildMenuSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        children: [
          _buildMenuItem(
            icon: Icons.location_on_outlined,
            title: "Adreslerim",
            onTap: () {
              viewModel.goAdreslerimView(context);
            },
          ),
          _buildDivider(),
          _buildMenuItem(
            icon: Icons.logout,
            title: "Çıkış Yap",
            iconColor: Colors.red,
            textColor: Colors.red,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? iconColor,
    Color? textColor,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: (iconColor ?? primaryTurquoise).withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: iconColor ?? primaryTurquoise, size: 22),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: textColor ?? darkBlue,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
    );
  }

  Widget _buildDivider() {
    return Divider(height: 1, indent: 60, endIndent: 20, color: Colors.grey.shade100);
  }
}
