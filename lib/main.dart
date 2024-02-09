import 'package:firstapp/Error.dart';
import 'package:firstapp/Home.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    var deviceData = <String, dynamic>{};

    try {
      final WindowsDeviceInfo windowsInfo = await deviceInfoPlugin.windowsInfo;
      deviceData = _readWindowsDeviceInfo(windowsInfo);
    } on PlatformException catch (e) {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version. ${e.message}'
      };
    }

    if (!mounted) return;

    setState(() {
      _deviceData = deviceData;
    });

    print("Device ID: ${_deviceData['deviceId']}");
    print("Computer Name: ${_deviceData['computerName']}");
  }

  Map<String, dynamic> _readWindowsDeviceInfo(WindowsDeviceInfo data) {
    return <String, dynamic>{
      'deviceId': data.deviceId,
      'computerName': data.computerName,
    };
  }

  String men_bergan_device_id = "{337B43BA-6FA8-42EE-87E1-DF8E59399650}";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0x9f4376f8),
      ),
      home: Scaffold(
        body: _deviceData != null &&
                _deviceData['deviceId'] == men_bergan_device_id
            ? Home(deviceData: _deviceData)
            : BoshqaWindows(deviceData: _deviceData),
      ),
    );
  }
}
