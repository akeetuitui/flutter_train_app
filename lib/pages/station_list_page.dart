import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String type = ModalRoute.of(context)!.settings.arguments as String;
    final stations = [
      "수서", "동탄", "평택지제", "천안아산", "오송",
      "대전", "김천구미", "동대구", "경주", "울산", "부산"
    ];

    return Scaffold(
      appBar: AppBar(title: Text(type)),
      body: ListView.builder(
        itemCount: stations.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              stations[index],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pop(context, stations[index]);
            },
          );
        },
      ),
    );
  }
}