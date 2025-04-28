import 'package:flutter/material.dart';

class MedicineDetail extends StatelessWidget {
  final dynamic item; // 선택된 약품 데이터

  const MedicineDetail({super.key, required this.item});

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
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              // 버튼 클릭 시 동작 추가
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${item.itemName}, 내 알약 통에 추가됨")),
              );
            },
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
