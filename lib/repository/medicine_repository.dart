import 'package:pilly/dataSource/medicine_data_soruce.dart';
import 'package:pilly/model/medicine.dart';

class MedicineRepository {
  final MedicineDataSource _dataSource = MedicineDataSource();

  Future<Medicine> fetchMedicines(int pageNo, int numOfRows) async {
    final medicine = await _dataSource.fetchMedicines(pageNo, numOfRows);
    return medicine;
  }

  Future<Medicine> searchMedicines(
    int pageNo,
    int numOfRows,
    String query,
  ) async {
    final medicine = await _dataSource.searchMedicines(
      pageNo,
      numOfRows,
      query,
    );
    return medicine;
  }

  Future<void> toggleMyMedicine(MedicineItem selectedMedicineItem) async {
    await _dataSource.toggleMyMedicine(selectedMedicineItem);
  }

  Future<List<MedicineItem>> getMyMedicine() async {
    final myMedicineList = await _dataSource.getMyMedicine();
    return myMedicineList;
  }
}
