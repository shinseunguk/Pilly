import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilly/view/detail/medicine_detail.dart';

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
          return GestureDetector(
            onTap: () {
              // 네비게이션 이동
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MedicineDetail(item: item),
                ),
              );
            },
            child: Container(
              height: 130, // 셀 높이를 임의로 지정
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // 그림자 위치
                  ),
                ],
              ),
              child: Row(
                children: [
                  item.itemImage != null
                      ? Image.network(
                        item.itemImage!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.fitWidth,
                      )
                      : Image.asset('assets/images/image_coming_soon.png'),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item.itemName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "${item.efcyQesitm}\n${item.entpName}",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite_border, color: Colors.grey),
                    onPressed: () {
                      // 즐겨찾기 버튼 클릭 이벤트 처리 (추후 구현)
                      print("${item.itemName} added to favorites");
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
