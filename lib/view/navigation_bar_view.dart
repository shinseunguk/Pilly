import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationBarView extends StatefulWidget {
  const NavigationBarView({super.key});

  @override
  State<NavigationBarView> createState() => _NavigationBarViewState();
}

class _NavigationBarViewState extends State<NavigationBarView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final RxInt _selectedIndex = 0.obs;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    ); // Adjust the length based on the number of tabs
    _tabController.addListener(() {
      _selectedIndex.value = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text('의약품 리스트')),
          Center(child: Text('내 알약통')),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: _selectedIndex.value,
          onTap: (index) {
            _tabController.animateTo(index);
          },
          enableFeedback: false, // 터치 효과 제거
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.medication),
              label: '의약품 리스트',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '내 알약통'),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
