import 'package:dart_ping/dart_ping.dart';
import 'package:test/test.dart';

void main() {
  test('google.com', () async {
    var ping = Ping('google.com', count: 1);
    var data = await ping.stream.first;
    expect(data, isA<PingData>());
  });

  test('Termination before starting', () async {
    var ping = Ping('google.com', count: 5);
    expect(ping.stop(), throwsException);
  });
}
