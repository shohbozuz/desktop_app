import 'package:flutter/material.dart';

class BoshqaWindows extends StatelessWidget {
  final Map<String, dynamic> deviceData;

  const BoshqaWindows({Key? key, required this.deviceData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nomalum windows"),
      ),
      body: Column(
        children: [
          Center(
            child:  Text(
              "Diqqat nomalum Qurilma. Agar kursni sotib olmoqchi bo'lsangiz +998971712402 ga tel qilib sotib olin",
            ),
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
