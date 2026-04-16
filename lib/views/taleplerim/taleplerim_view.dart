import 'package:ablan_halleder_mobil/model/talep_model.dart';
import 'package:ablan_halleder_mobil/views/taleplerim/taleplerim_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TaleplerimView extends StatefulWidget {
  const TaleplerimView({super.key});

  @override
  State<TaleplerimView> createState() => _TaleplerimViewState();
}

class _TaleplerimViewState extends State<TaleplerimView> {
  final TaleplerimViewModel viewModel = TaleplerimViewModel();

  final Color primaryTurquoise = const Color(0xFF149382);
  final Color darkBlue = const Color(0xFF122333);

  @override
  void initState() {
    super.initState();
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: viewModel.talepModelList.length,
          itemBuilder: (context, index) {
            return _buildRequestCard(viewModel.talepModelList[index]);
          },
        );
      },
    );
  }

  Widget _buildRequestCard(TalepModel model) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  model.baslik,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: darkBlue),
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: model.durum.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  model.durum.tr,
                  style: TextStyle(color: model.durum.color, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          const SizedBox(height: 12),
          _buildInfoRow(Icons.calendar_today_outlined, model.planlananTarih),
          const SizedBox(height: 8),
          _buildInfoRow(Icons.straighten_outlined, "${model.alan} m² Temizlik Alanı"),
          const SizedBox(height: 8),
          _buildInfoRow(Icons.pets_outlined, "Evcil Hayvan ${model.hayvanVarMi ? "VAR" : "YOK"}"),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ],
    );
  }
}