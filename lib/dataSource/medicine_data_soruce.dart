import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pilly/model/medicine.dart';

class MedicineDataSource {
  final String baseUrl =
      'http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList?type=json&serviceKey=3onWZgRV53rnylPh1uQuLL%2BA1cMkDXX3dzbSrUs0seNWIJgKbeFQXZ2CuSayHY%2Fm9uEQKfUc%2FmzlgF4MonCGcA%3D%3D&numOfRows=50';

  Future<Medicine> fetchMedicines() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Medicine.fromJson(json);
    } else {
      throw Exception('Failed to load medicines');
    }
  }
}
