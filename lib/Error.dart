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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Diqqat nomalum windows. Agar kursni sotib olmoqchi bo'lsangiz +998971712402 ga tel qilib sotib olin",
            ),
            SizedBox(height: 20),
            // BoshqaWindows widgetida ma'lumotlarni chiqarish
            Text("Sizning Device ID: ${deviceData['deviceId']}"),
            Text("Sizning Computer Name: ${deviceData['computerName']}"),
          ],
        ),
      ),
    );
  }
}
