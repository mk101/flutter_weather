import 'package:flutter_test/flutter_test.dart';
import 'package:weather/server/server.dart';
import 'package:weather/server/test_server.dart';

void main() {
  Server server = TestServer();
  test('test getCities func', () {
    var s = server.getCities();
    expect(s, ['MOS','SPB','NNOV']);
  });
}