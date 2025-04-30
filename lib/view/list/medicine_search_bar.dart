import 'package:flutter/material.dart';

class MedicineSearchBar extends StatelessWidget {
  final ValueChanged<String> onTextChanged; // 텍스트 변경 이벤트 콜백
  final TextEditingController controller; // TextEditingController 추가

  MedicineSearchBar({
    super.key,
    required this.onTextChanged,
    String initialValue = '', // 초기값을 받을 수 있도록 추가
  }) : controller = TextEditingController(text: initialValue); // 초기값 설정

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextField(
          controller: controller, // TextEditingController 연결
          onChanged: onTextChanged, // 텍스트 변경 이벤트 처리
          style: const TextStyle(fontSize: 14), // 글씨 크기 조정
          decoration: InputDecoration(
            hintText: '의약품명으로 검색',
            prefixIcon: const Icon(Icons.search),
            suffixIcon:
                controller
                        .text
                        .isNotEmpty // 텍스트가 있을 때만 X 버튼 표시
                    ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        controller.clear(); // 텍스트 필드 비우기
                        onTextChanged(''); // 콜백에 빈 문자열 전달
                      },
                    )
                    : null,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
