import 'package:get/get.dart';
import 'package:pilly/model/medicine.dart';
import 'package:pilly/repository/medicine_repository.dart';

class MedicineViewModel {
  late final MedicineRepository _repository;
  var medicine = <MedicineItem>[].obs;
  var isLoading = true.obs; // 로딩 상태 추가

  MedicineViewModel() {
    _repository = MedicineRepository();
  }

  Future<void> fetchMedicineItem() async {
    isLoading.value = true; // 로딩 시작
    // await Future.delayed(const Duration(seconds: 2));
    medicine.value = await _repository.fetchMedicines();
    isLoading.value = false; // 로딩 종료
  }
}
