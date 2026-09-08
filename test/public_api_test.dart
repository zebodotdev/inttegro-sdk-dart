import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:inttegro/inttegro.dart';
import 'package:test/test.dart';

void main() {
  test('client exposes typed resources', () {
    final client = Client(apiKey: 'sk_test_example');
    expect(client.orders, isA<Orders>());
    expect(const AmountParams(currency: Currency.ghs, value: 5000).value, 5000);
    client.close();
  });

  test('wire envelopes are unwrapped into domain values', () async {
    final httpClient = MockClient((request) async {
      expect(request.url.path, '/apps/lookup');
      expect(request.headers['authorization'], 'Bearer sk_test_example');
      return http.Response(
        jsonEncode({
          'app': {
            'id': 'app_test',
            'name': 'Test',
            'created_at': '2026-09-07T00:00:00Z',
          },
        }),
        200,
        headers: {'content-type': 'application/json'},
      );
    });
    final client = Client(apiKey: 'sk_test_example', httpClient: httpClient);
    final app = await client.apps.lookup();
    expect(app.id, 'app_test');
    client.close();
  });

  test('semantic collections control custom-data mutation', () {
    final original = CustomData({'order': 'first'});
    final updated = original.set('order', 'second').set('campaign', 'summer');

    expect(original['order'], 'first');
    expect(updated.toJson(), {'order': 'second', 'campaign': 'summer'});
    expect(() => updated.values['unsafe'] = 'mutation', throwsUnsupportedError);
    expect(() => CustomData({'x' * 257: 'too long'}), throwsArgumentError);

    final patch = CustomDataPatch().set('campaign', 'winter').unset('legacy');
    expect(patch.toJson(), {'campaign': 'winter', 'legacy': null});
  });
}
