import 'package:get/get.dart';
import 'package:pilly/model/medicine.dart';
import 'package:pilly/repository/medicine_repository.dart';

class MedicineListViewModel {
  late final MedicineRepository _repository;
  var medicineItem = <MedicineItem>[].obs;
  var myMedicineItem = <MedicineItem>[].obs;
  var isLoading = true.obs; // 로딩 상태 추가
  var totalCount = 0;
  var pageNo = 1;
  var numOfRows = 20;

  MedicineListViewModel() {
    _repository = MedicineRepository();
  }

  Future<void> fetchMedicine() async {
    isLoading.value = true; // 로딩 시작

    final medicine = await _repository.fetchMedicines(pageNo, numOfRows);
    totalCount = medicine.totalCount;
    medicineItem.addAll(medicine.items);

    // 즐겨 찾기 체크
    for (var item in medicineItem) {
      final isFavorite = await _repository.getMyMedicine();
      item.isFavorite = isFavorite.any(
        (favorite) => favorite.itemSeq == item.itemSeq,
      );
    }

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

    // 즐겨 찾기 체크
    for (var item in medicineItem) {
      final isFavorite = await _repository.getMyMedicine();
      item.isFavorite = isFavorite.any(
        (favorite) => favorite.itemSeq == item.itemSeq,
      );
    }

    isLoading.value = false; // 로딩 종료
  }

  Future<void> toggleMyMedicineList(MedicineItem selectedMedicineItem) async {
    await _repository.toggleMyMedicine(selectedMedicineItem);

    // Update in medicineItem list
    final medicineIndex = medicineItem.indexWhere(
      (item) => item.itemSeq == selectedMedicineItem.itemSeq,
    );
    if (medicineIndex != -1) {
      medicineItem[medicineIndex].isFavorite =
          !medicineItem[medicineIndex].isFavorite;
      medicineItem.refresh(); // Update the observable list
    }

    // Update in myMedicineItem list
    final myMedicineIndex = myMedicineItem.indexWhere(
      (item) => item.itemSeq == selectedMedicineItem.itemSeq,
    );
    if (myMedicineIndex != -1) {
      myMedicineItem[myMedicineIndex].isFavorite =
          !myMedicineItem[myMedicineIndex].isFavorite;
      myMedicineItem.refresh(); // Update the observable list
    }
  }

  Future<List<MedicineItem>> getMyMedicine() async {
    final myMedicineList = await _repository.getMyMedicine();
    return myMedicineList;
  }

  Future<void> fetchMyMedicine() async {
    isLoading.value = true; // 로딩 시작

    final myMedicineList = await _repository.getMyMedicine();
    myMedicineItem.assignAll(myMedicineList);
    for (var item in myMedicineItem) {
      item.isFavorite = true;
    }

    isLoading.value = false; // 로딩 종료
  }
}
