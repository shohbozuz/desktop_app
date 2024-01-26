import 'dart:async';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firstapp/Error.dart';
import 'package:firstapp/Home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
      if (kIsWeb) {
        deviceData = <String, dynamic>{
          'Error:': 'Web platform is not supported',
        };
      } else {
        deviceData = _readWindowsDeviceInfo(await deviceInfoPlugin.windowsInfo);
      }
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

  String men_bergan_device_id = "{AF12A3CB-62B8-4C67-A2CD-3369B24F5F1D}";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0x9f4376f8),
      ),
      home: Scaffold(
        body: (() {
          if (_deviceData != null &&
              _deviceData['deviceId'] == men_bergan_device_id) {
            return Home(deviceData: _deviceData);
          } else {
            return BoshqaWindows();
          }
        })(),
      ),
    );
  }
}


