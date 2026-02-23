import 'package:flutter_test/flutter_test.dart';
import 'package:host_bridge/host_bridge.dart';

/// Helper to read and assert on host filesystem via host_bridge (for patrol tests).
class FileHelper {
  FileHelper()
      : _client = HostBridgeClient(
          const String.fromEnvironment('HOST_BRIDGE_URL', defaultValue: ''),
        );

  final HostBridgeClient _client;

  /// Reads the file at [path] on the host and asserts its content equals [expected].
  /// Fails the test if the file is not found or content does not match.
  Future<void> expectPathContentEquals(String path, String expected) async {
    final response = await _client.fileOp(FilePostOpModelRead(path: path));

    if (response is StringFileResponse) {
      expect(response.response, expected, reason: 'File content at "$path"');
    } else if (response is FileNotFoundResponse) {
      fail('File not found: "$path"');
    } else {
      fail('Unexpected file response for "$path": $response');
    }
  }

  Future<void> writePathContent(String path, String content) async {
    await _client.fileOp(
      FilePostOpModelWriteString(path: path, content: content),
    );
  }
}
