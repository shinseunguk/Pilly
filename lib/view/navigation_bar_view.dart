import 'dart:async'; // Timer를 사용하려면 필요합니다.
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilly/view/list/medicine_search_bar.dart';
import 'package:pilly/viewModel/list/medicine_list_view_model.dart';
import 'package:pilly/view/list/medicine_list_view.dart';

class NavigationBarView extends StatefulWidget {
  const NavigationBarView({super.key});

  @override
  State<NavigationBarView> createState() => _NavigationBarViewState();
}

class _NavigationBarViewState extends State<NavigationBarView>
    with SingleTickerProviderStateMixin {
  final MedicineListViewModel _viewModel = Get.put(MedicineListViewModel());
  late TabController _tabController;
  final RxInt _selectedIndex = 0.obs;
  final RxString _searchText = ''.obs;

  Timer? _debounce; // 추가: 디바운스용 Timer
  final Duration _debounceDuration = Duration(
    milliseconds: 1000,
  ); // 추가: 디바운스 시간 설정

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      _selectedIndex.value = _tabController.index;

      // 탭 변경 후 ViewModel 메서드 호출
      if (_tabController.index == 0) {
        _viewModel.fetchMedicine(); // 첫 번째 탭: 의약품 리스트 갱신
      } else if (_tabController.index == 1) {
        _viewModel.fetchMyMedicine(); // 두 번째 탭: 내 알약 통 갱신
      }
    });
    _viewModel.fetchMedicine();
    _viewModel.fetchMyMedicine();
  }

  void handleTextChanged(String text) {
    if (_debounce?.isActive ?? false) _debounce!.cancel(); // 기존 타이머 취소
    _debounce = Timer(_debounceDuration, () {
      _searchText.value = text; // 검색어 업데이트

      _viewModel.medicineItem.clear(); // 기존 데이터 초기화
      _viewModel.pageNo = 1; // 페이지 번호 초기화
      _viewModel.totalCount = 0; // 총 개수 초기화

      if (text.isEmpty) {
        _viewModel.fetchMedicine(); // 약품 목록 새로고침(검색어가 없을 때)
      } else {
        _viewModel.searchMedicine(text); // 약품 목록 새로고침(검색어가 있을 때)
      }
    });
  }

  void handleLoadMore() {
    if (!_viewModel.isLoading.value) {
      if (_viewModel.medicineItem.length < _viewModel.totalCount) {
        if (_debounce?.isActive ?? false) return; // 디바운스 적용
        _debounce = Timer(_debounceDuration, () {
          _viewModel.pageNo++;
        });
        // _viewModel.isLoading.value = true; // 로딩 시작
        // _viewModel.fetchMedicineItem().then((_) {
        //   _viewModel.isLoading.value = false; // 로딩 종료
        // });
        if (_searchText.value.isEmpty) {
          _viewModel.fetchMedicine(); // 페이지네이션 로드(검색어가 없을 때)
        } else {
          _viewModel.searchMedicine(_searchText.value); // 페이지네이션 로드(검색어가 있을 때)
        }
      }
    }
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
              medicine: _viewModel.medicineItem,
              onLoadMore: handleLoadMore, // 페이지네이션 콜백 전달
              onFavoriteToggle: (item) {
                // 즐겨찾기 버튼 콜백
                _viewModel.toggleMyMedicineList(item);
              },
            );
          case 1:
            return MedicineList(
              isLoading: _viewModel.isLoading,
              medicine: _viewModel.myMedicineItem,
              onLoadMore: () {},
              onFavoriteToggle: (item) {
                // 즐겨찾기 버튼 콜백
                _viewModel.toggleMyMedicineList(item);
              },
            );
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
