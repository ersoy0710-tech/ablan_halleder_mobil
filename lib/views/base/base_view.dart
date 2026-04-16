import 'package:ablan_halleder_mobil/views/base/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class BaseView extends StatefulWidget {
  const BaseView({super.key});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  final BaseViewModel viewModel = BaseViewModel();

  final Color primaryTurquoise = const Color(0xFF149382);
  final Color darkBlue = const Color(0xFF122333);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Observer(
        builder: (context) {
          return SafeArea(
            child: viewModel.views[viewModel.seciliSayfa],
          );
        },
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
      bottomNavigationBar: Observer(builder: (context) => _buildBottomAppBar()),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        shape: Border(
          bottom: BorderSide(
            color: Colors.grey.shade100,
            width: 1,
          ),
        ),
        title: Observer(
          builder: (context) {
            return Text(
                viewModel.navItems[viewModel.seciliSayfa].title,
                style: TextStyle(color: darkBlue, fontWeight: FontWeight.bold)
            );
          },
        )
    );
  }

  Widget _buildBottomAppBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      color: Colors.white,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (int i = 0; i < 2; i++)
              _buildNavItem(
                viewModel.navItems[i].icon,
                viewModel.navItems[i].title,
                viewModel.seciliSayfa == i,
                onTap: () => viewModel.sayfaDegistir(i),
              ),

            const SizedBox(width: 36),

            for (int i = 2; i < 4; i++)
              _buildNavItem(
                viewModel.navItems[i].icon,
                viewModel.navItems[i].title,
                viewModel.seciliSayfa == i,
                onTap: () => viewModel.sayfaDegistir(i),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isSelected, {required VoidCallback onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: isSelected ? primaryTurquoise : Colors.grey),
            const SizedBox(height: 4),
            Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  color: isSelected ? primaryTurquoise : Colors.grey,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                )
            ),
          ],
        ),
      ),
    );
  }
}
