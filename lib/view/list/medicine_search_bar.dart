import 'package:flutter/material.dart';

class MedicineSearchBar extends StatelessWidget implements PreferredSizeWidget {
  final ValueChanged<String> onTextChanged; // 텍스트 변경 이벤트 콜백
  final TextEditingController controller; // TextEditingController 추가

  MedicineSearchBar({
    super.key,
    required this.onTextChanged,
    String initialValue = '', // 초기값을 받을 수 있도록 추가
  }) : controller = TextEditingController(text: initialValue); // 초기값 설정

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextField(
          controller: controller, // TextEditingController 연결
          onChanged: onTextChanged, // 텍스트 변경 이벤트 처리
          decoration: InputDecoration(
            label: const Text('의약품명 검색'),
            hintText: '의약품명으로 검색',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
