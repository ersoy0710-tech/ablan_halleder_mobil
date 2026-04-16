import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'adreslerim_view_model.dart';

class AdreslerimView extends StatefulWidget {
  const AdreslerimView({super.key});

  @override
  State<AdreslerimView> createState() => _AdreslerimViewState();
}

class _AdreslerimViewState extends State<AdreslerimView> {
  final AdreslerimViewModel viewModel = AdreslerimViewModel();

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
        title: Text("Adreslerim", style: TextStyle(color: darkBlue, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: darkBlue),
      ),
      body: Observer(
        builder: (_) => viewModel.adresModelList.isEmpty
            ? _buildEmptyState()
            : ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: viewModel.adresModelList.length,
          itemBuilder: (context, index) {
            final adres = viewModel.adresModelList[index];
            return _buildDismissibleCard(adres, index);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          viewModel.goAdresEkleView(context);
        },
        backgroundColor: primaryTurquoise,
        icon: const Icon(Icons.add_location_alt_outlined, color: Colors.white),
        label: const Text("Yeni Adres Ekle", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildDismissibleCard(adres, int index) {
    return Dismissible(
      key: Key(adres.id),
      direction: DismissDirection.startToEnd,
      confirmDismiss: (direction) async {
        return await viewModel.adresSil(index);
      },
      background: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.red.shade400,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20),
        child: const Icon(Icons.delete_outline, color: Colors.white, size: 30),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade100),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: primaryTurquoise.withOpacity(0.1),
              child: Icon(Icons.location_on, color: primaryTurquoise),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(adres.baslik, style: TextStyle(fontWeight: FontWeight.bold, color: darkBlue, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(adres.adres, style: const TextStyle(color: Colors.grey, fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.location_off_outlined, size: 80, color: Colors.grey.shade300),
          const SizedBox(height: 16),
          Text("Henüz bir adres eklemediniz.", style: TextStyle(color: Colors.grey.shade600, fontSize: 16)),
        ],
      ),
    );
  }
}