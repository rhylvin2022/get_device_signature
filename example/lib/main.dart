import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get_device_signature/get_device_signature.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _deviceSignature = 'Unknown';

  @override
  void initState() {
    super.initState();
    initDeviceSignature();
  }

  // Fetch device signature
  Future<void> initDeviceSignature() async {
    String deviceSignature;
    try {
      deviceSignature =
          await GetDeviceSignature.getSignature() ?? 'Unknown signature';
    } on PlatformException {
      deviceSignature = 'Failed to get device signature.';
    }

    if (!mounted) return;

    setState(() {
      _deviceSignature = deviceSignature;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Device Signature Example'),
        ),
        body: Center(
          child: Text('Device Signature: $_deviceSignature\n'),
        ),
      ),
    );
  }
}
