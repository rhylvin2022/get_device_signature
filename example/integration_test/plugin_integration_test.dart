import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:get_device_signature/get_device_signature.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('getDeviceSignature test', (WidgetTester tester) async {
    final String? signature = await GetDeviceSignature.getSignature();

    // Ensure that a non-empty string is returned
    expect(signature?.isNotEmpty, true);
  });
}
