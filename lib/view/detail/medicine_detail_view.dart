import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilly/model/medicine.dart';

class MedicineDetailView extends StatelessWidget {
  final MedicineItem item; // 선택된 약품 데이터
  final void Function(MedicineItem item) onFavoriteToggle; // 즐겨찾기 버튼 콜백
  final RxBool isFavorite; // Rx 상태로 즐겨찾기 상태 관리

  MedicineDetailView({
    super.key,
    required this.item,
    required this.onFavoriteToggle,
  }) : isFavorite = item.isFavorite.obs; // 초기값 설정

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          item.itemName,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18, // 폰트 크기 변경
            fontWeight: FontWeight.bold, // 폰트 두께 변경
            overflow: TextOverflow.ellipsis, // 길면 생략 표시
          ),
          maxLines: 2, // 한 줄로 제한
        ),
        actions: [
          Obx(
            () => IconButton(
              icon: Icon(
                isFavorite.value ? Icons.favorite : Icons.favorite_border,
                color: isFavorite.value ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                // 즐겨찾기 상태 토글
                onFavoriteToggle(item); // 즐겨찾기 토글 콜백 호출
                isFavorite.value = !isFavorite.value;

                // 상태 변경 후 스낵바 표시
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "'${item.itemName}'이(가) ${isFavorite.value ? '내 알약 통에 추가되었습니다.' : '내 알약 통에서 삭제되었습니다.'}",
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (item.itemImage != null)
                Image.network(
                  item.itemImage!,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              const SizedBox(height: 16),
              _buildDetailRow("제조사", item.entpName),
              _buildDetailRow("효능", item.efcyQesitm ?? '정보 없음'),
              _buildDetailRow("사용 방법", item.useMethodQesitm ?? '정보 없음'),
              _buildDetailRow("주의사항 경고", item.atpnWarnQesitm ?? '정보 없음'),
              _buildDetailRow("주의사항", item.atpnQesitm ?? '정보 없음'),
              _buildDetailRow("상호작용", item.intrcQesitm ?? '정보 없음'),
              _buildDetailRow("부작용", item.seQesitm ?? '정보 없음'),
              _buildDetailRow("보관 방법", item.depositMethodQesitm ?? '정보 없음'),
              _buildDetailRow("공개 날짜", item.openDe),
              _buildDetailRow("업데이트 날짜", item.updateDe),
              _buildDetailRow("사업자 등록번호", item.bizrno),
            ],
          ),
        ),
      ),
    );
  }

  // 반복되는 Text.rich를 줄이기 위한 메서드
  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "$title\n",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(fontWeight: FontWeight.normal),
            ),
          ],
        ),
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
