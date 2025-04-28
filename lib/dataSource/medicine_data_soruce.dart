import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:pilly/model/medicine.dart';

class MedicineDataSource {
  final baseUrl =
      "http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList";
  final serverKey = dotenv.env['SERVER_KEY'];
  final type = "json";
  final numOfRows = 20;
  late final String url =
      "$baseUrl?serviceKey=$serverKey&numOfRows=$numOfRows&type=$type";

  Future<Medicine> fetchMedicines() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Medicine.fromJson(json);
    } else {
      throw Exception('Failed to load medicines');
    }
  }

  Future<Medicine> searchMedicines(String query) async {
    final response = await http.get(Uri.parse('$url&itemName=$query'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Medicine.fromJson(json);
    } else {
      throw Exception('Failed to load medicines');
    }
  }
}
