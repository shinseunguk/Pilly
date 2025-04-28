import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicineList extends StatelessWidget {
  final RxBool isLoading; // 로딩 상태를 Rx로 받음
  final RxList<dynamic> medicine; // 약품 데이터를 Rx로 받음

  const MedicineList({
    super.key,
    required this.isLoading,
    required this.medicine,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (isLoading.value) {
        return const Center(child: CircularProgressIndicator()); // 로딩 상태
      }

      if (medicine.isEmpty) {
        return const Center(child: Text('No data available')); // 데이터 없음 상태
      }

      return ListView.builder(
        itemCount: medicine.length,
        itemBuilder: (context, index) {
          final item = medicine[index];
          return ListTile(
            leading:
                item.itemImage != null
                    ? Image.network(
                      item.itemImage!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    )
                    : const Icon(Icons.medical_services, size: 50),
            title: Text(item.itemName),
            subtitle: Text(item.entpName),
          );
        },
      );
    });
  }
}
