import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final Map<String, dynamic> deviceData;

  const Home({Key? key, required this.deviceData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Theme.of(context).platform == TargetPlatform.android
            ? "Tanlangan Android"
            : "Tanlangan Windows"),
      ),
      body: Column(
        children: [
          Center(
            child: Text("Bu yerda kurslar bo'ladi"),
          ),
          if (Theme.of(context).platform == TargetPlatform.android)
            Center(
              child: Text("Andoid id ${deviceData['androidId']}"),
            ),
          if (Theme.of(context).platform == TargetPlatform.android)
            Center(
              child: Text("Andoid Brand ${deviceData['androidBrand']}"),
            ),
          if (Theme.of(context).platform == TargetPlatform.windows)
            Center(
              child: Text("Device id ${deviceData['deviceId']}"),
            ),
          if (Theme.of(context).platform == TargetPlatform.windows)
            Center(
              child: Text("Computer Name ${deviceData['computerName']}"),
            ),
        ],
      ),
    );
  }
}
