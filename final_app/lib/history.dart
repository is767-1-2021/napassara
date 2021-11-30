import 'package:final_app/Services/Calculator_services.dart';
import 'package:final_app/controller/Calculator_controller.dart';
import 'package:final_app/model/Calculator_model.dart';
import 'package:flutter/material.dart';


class HistoryView extends StatefulWidget {
  @override
  _HistoryViewState createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  Services? service;
  HistoryController? controller;
  List<History> history = List.empty();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    service = historysService();
    controller = HistoryController(service!);
    controller!.OnSync
        .listen((bool synState) => setState(() => isLoading = synState));
    gethistory();
  }

  void gethistory() async {
    var newHistory = await controller!.fetchHistorys();

    setState(() {
      history = newHistory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              title: Text('History'),
            ),
            body: ListView.separated(
              itemCount: history.isEmpty ? 1 : history.length,
              itemBuilder: (BuildContext context, index) {
                if (history.isEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("ไม่พบข้อมูลจากฐานข้อมูล",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                    ],
                  );
                }

                History newHistory = history[index];
                return ListTile(
                  title: Text(newHistory.historyCal,
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.white, fontSize: 22)),
                  subtitle: Text(newHistory.historyResult,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30)),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Colors.black,
                );
              },
            ),
          );
  }
}
