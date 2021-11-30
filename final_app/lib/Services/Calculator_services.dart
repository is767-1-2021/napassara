import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app/model/Calculator_model.dart';

abstract class Services {
  Future<List<History>> getHistorys();
  // Future<String> addresult(String equation, String result);
}

class historysService extends Services {
  @override
  Future<List<History>> getHistorys() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('History').get();

    AllHistorys historys = AllHistorys.fromsnapshot(snapshot);
    return historys.historys;
  }
/*
  @override
  Future<String> addresult(String equation, String result) async {
    FirebaseFirestore.instance
        .collection('History')
        .add({'historyCal': equation + ' =', 'historyResult': result});
  }*/
}
