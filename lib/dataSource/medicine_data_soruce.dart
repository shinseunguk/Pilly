import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:pilly/model/medicine.dart';

class MedicineDataSource {
  final baseUrl =
      "http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList";
  final serverKey = dotenv.env['SERVER_KEY'];
  final type = "json";
  late final String url = "$baseUrl?serviceKey=$serverKey&type=$type";

  Future<Medicine> fetchMedicines(int pageNo, int numOfRows) async {
    final response = await http.get(
      Uri.parse('$url&pageNo=$pageNo&numOfRows=$numOfRows'),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Medicine.fromJson(json);
    } else {
      throw Exception('Failed to load medicines');
    }
  }

  Future<Medicine> searchMedicines(
    int pageNo,
    int numOfRows,
    String query,
  ) async {
    final response = await http.get(
      Uri.parse('$url&pageNo=$pageNo&numOfRows=$numOfRows&itemName=$query'),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Medicine.fromJson(json);
    } else {
      throw Exception('Failed to load medicines');
    }
  }
}
