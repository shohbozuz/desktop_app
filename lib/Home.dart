import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final Map<String, dynamic> deviceData;

  const Home({Key? key, required this.deviceData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tanlangan windows"),
      ),
      body: Column(
        children: [
          Center(
            child: Text("Bu yerda kurslar bo'ladi"),
          ),
          Center(
            child: Text("Device id ${deviceData['deviceId']}"),
          ),
          Center(
            child: Text("Device id ${deviceData['computerName']}"),
          ),
        ],
      ),
    );
  }
}
