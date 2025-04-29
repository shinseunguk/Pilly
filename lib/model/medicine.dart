class Medicine {
  final int totalCount; // 전체 데이터 개수
  final int pageNo; // 현재 페이지 번호
  final int numOfRows; // 페이지당 데이터 개수
  final List<MedicineItem> items; // 약품 리스트

  Medicine({
    required this.totalCount,
    required this.pageNo,
    required this.numOfRows,
    required this.items,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      totalCount: json['body']['totalCount'] as int,
      pageNo: json['body']['pageNo'] as int,
      numOfRows: json['body']['numOfRows'] as int,
      items:
          (json['body']['items'] as List<dynamic>?)
              ?.map((item) => MedicineItem.fromJson(item))
              .toList() ??
          [], // items가 없으면 빈 리스트 반환
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalCount': totalCount,
      'pageNo': pageNo,
      'numOfRows': numOfRows,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }

  List<Map<String, dynamic>> itemsToJson() {
    return items.map((item) => item.toJson()).toList();
  }
}

class MedicineItem {
  final String entpName; // 제조사 이름
  final String itemName; // 약품 이름
  final String itemSeq; // 약품 고유 번호
  final String? efcyQesitm; // 효능
  final String? useMethodQesitm; // 사용 방법
  final String? atpnWarnQesitm; // 주의사항 경고
  final String? atpnQesitm; // 주의사항
  final String? intrcQesitm; // 상호작용
  final String? seQesitm; // 부작용
  final String? depositMethodQesitm; // 보관 방법
  final String openDe; // 공개 날짜
  final String updateDe; // 업데이트 날짜
  final String? itemImage; // 약품 이미지 URL
  final String bizrno; // 사업자 등록번호
  var isFavorite = false; // 즐겨찾기 여부

  MedicineItem({
    required this.entpName,
    required this.itemName,
    required this.itemSeq,
    this.efcyQesitm,
    this.useMethodQesitm,
    this.atpnWarnQesitm,
    this.atpnQesitm,
    this.intrcQesitm,
    this.seQesitm,
    this.depositMethodQesitm,
    required this.openDe,
    required this.updateDe,
    this.itemImage,
    required this.bizrno,
  });

  factory MedicineItem.fromJson(Map<String, dynamic> json) {
    return MedicineItem(
      entpName: json['entpName'] as String,
      itemName: json['itemName'] as String,
      itemSeq: json['itemSeq'] as String,
      efcyQesitm: json['efcyQesitm'] as String?,
      useMethodQesitm: json['useMethodQesitm'] as String?,
      atpnWarnQesitm: json['atpnWarnQesitm'] as String?,
      atpnQesitm: json['atpnQesitm'] as String?,
      intrcQesitm: json['intrcQesitm'] as String?,
      seQesitm: json['seQesitm'] as String?,
      depositMethodQesitm: json['depositMethodQesitm'] as String?,
      openDe: json['openDe'] as String,
      updateDe: json['updateDe'] as String,
      itemImage: json['itemImage'] as String?,
      bizrno: json['bizrno'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'entpName': entpName,
      'itemName': itemName,
      'itemSeq': itemSeq,
      'efcyQesitm': efcyQesitm,
      'useMethodQesitm': useMethodQesitm,
      'atpnWarnQesitm': atpnWarnQesitm,
      'atpnQesitm': atpnQesitm,
      'intrcQesitm': intrcQesitm,
      'seQesitm': seQesitm,
      'depositMethodQesitm': depositMethodQesitm,
      'openDe': openDe,
      'updateDe': updateDe,
      'itemImage': itemImage,
      'bizrno': bizrno,
    };
  }
}
