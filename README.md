# 📱 Get Device Signature

A **Flutter plugin** that gets the device's **signature**

## 🛠 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  get_device_signature: latest_version
```

Run:
```sh
flutter pub get
```

## 🚀 Features

✅ **Null safety** support (starting from version 3.0.0)  
✅ Gets the device's **signature**  
✅ Supports **Android** and **iOS**  
✅ Lightweight and easy to use

## 🚀 Usage

Import the package:

```dart
import 'package:get_device_signature/get_device_signature.dart';
```

### Example: Get the Device's Signature

```dart
void getDeviceSignature() async {
  String signature = await GetDeviceSignature().getSignature();
  print("signature: $signature");
}
```

## 💡 Why Use Emulator Detection?
- **Security**: Ensure device authenticity by verifying the app’s signature.
- **Anti-Tampering**: Detect modifications and unauthorized app clones.
- **Feature Control**: Restrict access based on trusted signatures.

## ❤️ Support My Work

If you find this package useful, you can **[buy me a coffee](https://buymeacoffee.com/rhylvin)** to support development!

[![Buy Me a Coffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-Support-orange?style=flat&logo=buy-me-a-coffee)](https://buymeacoffee.com/rhylvin)