import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:pilly/model/medicine.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<void> toggleMyMedicine(MedicineItem selectedMedicineItem) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // 기존 데이터 가져오기
    String? jsonString = prefs.getString('myMedicineList');
    List<Map<String, dynamic>> myMedicineList = [];

    if (jsonString != null) {
      List<dynamic> jsonList = jsonDecode(jsonString);
      myMedicineList =
          jsonList.map((item) => Map<String, dynamic>.from(item)).toList();
    }

    // 데이터가 이미 있는지 확인
    final existingIndex = myMedicineList.indexWhere(
      (item) => item['itemSeq'] == selectedMedicineItem.itemSeq,
    );

    if (existingIndex != -1) {
      // 이미 있는 데이터면 삭제
      myMedicineList.removeAt(existingIndex);
    } else {
      // 없는 데이터면 추가
      myMedicineList.add(selectedMedicineItem.toJson());
    }

    // 다시 저장
    await prefs.setString('myMedicineList', jsonEncode(myMedicineList));
  }

  Future<List<MedicineItem>> getMyMedicine() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('myMedicineList');
    List<MedicineItem> myMedicineList = [];

    if (jsonString != null) {
      List<dynamic> jsonList = jsonDecode(jsonString);
      myMedicineList =
          jsonList.map((item) => MedicineItem.fromJson(item)).toList();
    }

    return myMedicineList;
  }
}
