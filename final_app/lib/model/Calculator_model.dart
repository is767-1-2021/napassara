import 'package:cloud_firestore/cloud_firestore.dart';

class History {
  final String historyCal;
  final String historyResult;

  History(this.historyCal, this.historyResult);

  factory History.fromJson(
    Map<String, dynamic> json,
  ) {
    return History(
      json['historyCal'] as String,
      json['historyResult'] as String,
    );
  }

  static toJson() {}
}

class AllHistorys {
  final List<History> historys;
  AllHistorys(this.historys);

  factory AllHistorys.fromJson(List<dynamic> json) {
    List<History> historys;

    historys = json.map((index) => History.fromJson(index)).toList();
    return AllHistorys(historys);
  }

  factory AllHistorys.fromsnapshot(QuerySnapshot s) {
    List<History> historys = s.docs.map((DocumentSnapshot ds) {
      return History.fromJson(ds.data() as Map<String, dynamic>);
    }).toList();
    return AllHistorys(historys);
  }
}
