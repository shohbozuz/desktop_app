import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';

import 'Error.dart';
import 'Home.dart';

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
      if (Theme.of(context).platform == TargetPlatform.android) {
        final AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
        deviceData = _readAndroidBuildData(androidInfo);
      } else if (Theme.of(context).platform == TargetPlatform.windows) {
        final WindowsDeviceInfo windowsInfo = await deviceInfoPlugin.windowsInfo;
        deviceData = _readWindowsDeviceInfo(windowsInfo);
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

    print("Android Brand: ${_deviceData['androidBrand']}");
    print("Android ID: ${_deviceData['androidId']}");
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo data) {
    return <String, dynamic>{
      'androidBrand': data.brand,
      'androidId': data.id,
      // Add other Android-specific data here as needed
    };
  }

  Map<String, dynamic> _readWindowsDeviceInfo(WindowsDeviceInfo data) {
    return <String, dynamic>{
      'deviceId': data.deviceId,
      'computerName': data.computerName,
      // Add other Windows-specific data here as needed
    };
  }

  String men_bergan_windows_device_id = "{sB9EF1387-FF7A-4F3D-A838-EC8F01355536}";
  String men_bergan_andoid_id = "UKQ1.230917.001";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0x9f4376f8),
      ),
      home: Scaffold(
        body: (_deviceData.containsKey('androidId') &&
                _deviceData['androidId'] == men_bergan_andoid_id &&
                Theme.of(context).platform == TargetPlatform.android ||
                _deviceData.containsKey('deviceId') &&
                    _deviceData['deviceId'] == men_bergan_windows_device_id &&
                    Theme.of(context).platform == TargetPlatform.windows)
            ? Home(deviceData: _deviceData)
            : BoshqaWindows(deviceData: _deviceData),
      ),
    );
  }
}
