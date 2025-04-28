import 'dart:async'; // Timer를 사용하려면 필요합니다.
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilly/view/list/medicine_search_bar.dart';
import 'package:pilly/viewModel/medicine_view_model.dart';
import 'package:pilly/view/list/medicine_list.dart';

class NavigationBarView extends StatefulWidget {
  const NavigationBarView({super.key});

  @override
  State<NavigationBarView> createState() => _NavigationBarViewState();
}

class _NavigationBarViewState extends State<NavigationBarView>
    with SingleTickerProviderStateMixin {
  final MedicineViewModel _viewModel = Get.put(MedicineViewModel());
  late TabController _tabController;
  final RxInt _selectedIndex = 0.obs;
  final RxString _searchText = ''.obs;

  Timer? _debounce; // 추가: 디바운스용 Timer
  final Duration _debounceDuration = Duration(
    milliseconds: 500,
  ); // 추가: 디바운스 시간 설정

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      _selectedIndex.value = _tabController.index;
    });
    _viewModel.fetchMedicineItem();
  }

  void handleTextChanged(String text) {
    if (_debounce?.isActive ?? false) _debounce!.cancel(); // 기존 타이머 취소
    _debounce = Timer(_debounceDuration, () {
      _searchText.value = text; // 검색어 업데이트
      _viewModel.searchMedicine(text); // 검색어로 약품 검색
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Obx(() {
          switch (_selectedIndex.value) {
            case 0:
              return MedicineSearchBar(
                onTextChanged: handleTextChanged,
                initialValue: _searchText.value,
              );
            case 1:
              return AppBar(title: const Text('내 알약 통'), centerTitle: true);
            default:
              return AppBar(); // Default case to handle unexpected values
          }
        }),
      ),
      body: Obx(() {
        switch (_selectedIndex.value) {
          case 0:
            return MedicineList(
              isLoading: _viewModel.isLoading,
              medicine: _viewModel.medicine,
            );
          case 1:
            return const Center(child: Text('내 알약 통'));
          default:
            return const Center(child: Text('Unknown tab'));
        }
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: _selectedIndex.value,
          onTap: (index) {
            _tabController.animateTo(index);
          },
          enableFeedback: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.medication),
              label: '의약품 리스트',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: '내 알약 통',
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _debounce?.cancel(); // 추가: 타이머 정리
    super.dispose();
  }
}
