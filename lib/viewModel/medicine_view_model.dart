import 'package:get/get.dart';
import 'package:pilly/model/medicine.dart';
import 'package:pilly/repository/medicine_repository.dart';

class MedicineViewModel {
  late final MedicineRepository _repository;
  var medicineItem = <MedicineItem>[].obs;
  var isLoading = true.obs; // 로딩 상태 추가
  var totalCount = 0;
  var pageNo = 1;
  var numOfRows = 20;

  MedicineViewModel() {
    _repository = MedicineRepository();
  }

  Future<void> fetchMedicine() async {
    isLoading.value = true; // 로딩 시작

    final medicine = await _repository.fetchMedicines(pageNo, numOfRows);
    totalCount = medicine.totalCount;
    medicineItem.addAll(medicine.items);

    isLoading.value = false; // 로딩 종료
  }

  Future<void> searchMedicine(String query) async {
    isLoading.value = true; // 로딩 시작

    final medicine = await _repository.searchMedicines(
      pageNo,
      numOfRows,
      query,
    );
    totalCount = medicine.totalCount;
    medicineItem.addAll(medicine.items);

    isLoading.value = false; // 로딩 종료
  }
}
