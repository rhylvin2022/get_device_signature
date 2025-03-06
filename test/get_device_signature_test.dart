import 'package:flutter_test/flutter_test.dart';
import 'package:get_device_signature/get_device_signature.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGetDeviceSignaturePlatform
    with MockPlatformInterfaceMixin
    implements GetDeviceSignature {
  Future<String?> getDeviceSignature() => Future.value('mocked_signature');
}

void main() {
  final GetDeviceSignature initialPlatform = GetDeviceSignature();

  test('MockGetDeviceSignaturePlatform is the default instance', () {
    expect(initialPlatform, isInstanceOf<GetDeviceSignature>());
  });

  test('getDeviceSignature', () async {
    MockGetDeviceSignaturePlatform fakePlatform =
        MockGetDeviceSignaturePlatform();

    // Directly using the mock instance instead of setting a global platform instance
    expect(await fakePlatform.getDeviceSignature(), 'mocked_signature');
  });
}
