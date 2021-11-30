import 'dart:async';

import 'package:final_app/Services/Calculator_services.dart';
import 'package:final_app/model/Calculator_model.dart';

class HistoryController {
  final Services service;
  List<History> historys = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get OnSync => onSyncController.stream;

  HistoryController(this.service);

  Future<List<History>> fetchHistorys() async {
    onSyncController.add(true);
    historys = await service.getHistorys();
    onSyncController.add(false);
    return historys;
  }
}
