import 'package:pilly/dataSource/medicine_data_soruce.dart';
import 'package:pilly/model/medicine.dart';

class MedicineRepository {
  final MedicineDataSource _dataSource = MedicineDataSource();

  Future<List<MedicineItem>> fetchMedicines() async {
    final medicine = await _dataSource.fetchMedicines();
    return medicine.items;
  }
}
