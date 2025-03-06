import 'package:flutter/services.dart';

class GetDeviceSignature {
  static const MethodChannel _channel = MethodChannel('get_device_signature');

  static Future<String?> getSignature() async {
    try {
      final String? signature =
          await _channel.invokeMethod('getDeviceSignature');
      return signature;
    } on PlatformException catch (e) {
      print("Failed to get signature: '${e.message}'.");
      return null;
    }
  }
}
