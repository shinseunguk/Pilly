import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilly/model/medicine.dart';
import 'package:pilly/view/detail/medicine_detail_view.dart';

class MedicineList extends StatelessWidget {
  final RxBool isLoading; // 로딩 상태를 Rx로 받음
  final RxList<dynamic> medicine; // 약품 데이터를 Rx로 받음
  final VoidCallback onLoadMore; // 추가 데이터를 로드하는 콜백
  final void Function(MedicineItem item) onFavoriteToggle; // 즐겨찾기 버튼 콜백
  final ScrollController _scrollController = ScrollController(); // 스크롤 컨트롤러 추가

  MedicineList({
    super.key,
    required this.isLoading,
    required this.medicine,
    required this.onLoadMore, // 추가 데이터를 로드하는 콜백
    required this.onFavoriteToggle, // 즐겨찾기 버튼 콜백 추가
  });

  @override
  Widget build(BuildContext context) {
    // 스크롤 이벤트 감지
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        onLoadMore(); // 스크롤이 끝에 도달하면 추가 데이터 로드
      }
    });

    return Obx(() {
      if (isLoading.value && medicine.isEmpty) {
        return const Center(child: CircularProgressIndicator()); // 초기 로딩 상태
      } else if (!isLoading.value && medicine.isEmpty) {
        return const Center(child: Text('No data available')); // 데이터 없음 상태
      } else if (medicine.isEmpty) {
        return const Center(child: Text('No data available')); // 데이터 없음 상태
      }

      return ListView.builder(
        controller: _scrollController, // 스크롤 컨트롤러 추가
        itemCount: medicine.length + 1, // 로딩 인디케이터를 위한 추가 아이템
        itemBuilder: (context, index) {
          if (index == medicine.length) {
            // 마지막 아이템에 로딩 인디케이터 표시
            return isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : const SizedBox.shrink();
          }

          final item = medicine[index];
          return GestureDetector(
            onTap: () {
              // 네비게이션 이동
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => MedicineDetailView(
                        item: item,
                        onFavoriteToggle: onFavoriteToggle, // 즐겨찾기 버튼 콜백 전달
                      ),
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
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return SizedBox(
                            width: 100,
                            height: 100,
                            child: Center(
                              child: CircularProgressIndicator(
                                value:
                                    loadingProgress.expectedTotalBytes != null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            (loadingProgress
                                                    .expectedTotalBytes ??
                                                1)
                                        : null,
                              ),
                            ),
                          );
                        },
                      )
                      : Image.asset(
                        'assets/images/image_coming_soon.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.fitWidth,
                      ),
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
                          maxLines: 1, // 제목도 말 줄임표 처리
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4), // 간격 조정
                        Text(
                          item.entpName,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1, // 제조사 이름도 한 줄로 제한
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.efcyQesitm ?? '', // 효능 정보
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          maxLines: 2, // 최대 2줄로 제한
                          overflow: TextOverflow.ellipsis, // 넘칠 경우 말 줄임표 처리
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      item.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: item.isFavorite ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      // 즐겨찾기 버튼 클릭 이벤트 처리 (추후 구현)
                      onFavoriteToggle(item); // 즐겨찾기 토글 콜백 호출
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "'${item.itemName}'이(가) ${item.isFavorite ? '내 알약 통에서 삭제되었습니다.' : '내 알약 통에 추가되었습니다.'}",
                          ),
                        ),
                      );
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
