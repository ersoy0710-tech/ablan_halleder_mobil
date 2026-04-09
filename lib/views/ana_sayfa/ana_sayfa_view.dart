import 'package:flutter/material.dart';

class AnaSayfaView extends StatefulWidget {
  const AnaSayfaView({super.key});

  @override
  State<AnaSayfaView> createState() => _AnaSayfaViewState();
}

class _AnaSayfaViewState extends State<AnaSayfaView> {
  final Color primaryTurquoise = const Color(0xFF149382);
  final Color darkBlue = const Color(0xFF122333);
  final Color lightCardColor = const Color(0xFFF1F9F8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Aktif Talebim"),
            const SizedBox(height: 12),
            _buildActiveRequestCard(),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSectionTitle("Son Talepler"),
                TextButton(
                  onPressed: () {},
                  child: Text("Tümünü Gör", style: TextStyle(color: primaryTurquoise, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/talep_olustur');
        },
        backgroundColor: primaryTurquoise,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomAppBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text("Ana Sayfa", style: TextStyle(color: darkBlue, fontWeight: FontWeight.bold))
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: darkBlue));
  }

  Widget _buildActiveRequestCard() {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [lightCardColor, Colors.white],
          begin: Alignment.topLeft, end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: primaryTurquoise.withValues(alpha: 0.1)),
      ),
    );
  }

  Widget _buildRequestListItem(String title, String subtitle, Color statusColor, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 8)],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade100,
            child: Icon(icon, color: Colors.grey, size: 20),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: darkBlue)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    CircleAvatar(radius: 3, backgroundColor: statusColor),
                    const SizedBox(width: 6),
                    Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildBottomAppBar() {
    return BottomAppBar(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: const CircularNotchedRectangle(),
      padding: EdgeInsets.zero,
      notchMargin: 8,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.shade100)
          )
        ),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(Icons.home_filled, "Ana Sayfa", true),
            _buildNavItem(Icons.assignment_outlined, "Taleplerim", false),
            const SizedBox(width: 40),
            _buildNavItem(Icons.chat_bubble_outline, "Mesajlar", false),
            _buildNavItem(Icons.person_outline, "Profil", false),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isSelected) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? primaryTurquoise : Colors.grey),
          Text(label, style: TextStyle(fontSize: 10, color: isSelected ? primaryTurquoise : Colors.grey)),
        ],
      ),
    );
  }
}