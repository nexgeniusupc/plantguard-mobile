import '../../models/device/device.dart';
import '../../models/device/pairing.dart';
import '../http/api_client.dart';

class PairingService {
  final ApiClient _client;

  PairingService(this._client);

  Future<DevicePairFindResponse> find(String code) async {
    final query = {'code': code};
    final response = await _client.get('/pair/find', query: query);
    return DevicePairFindResponse.fromJson(response);
  }

  Future<Device> confirm(String code, {required String name}) async {
    final request = DevicePairConfirmRequest(code: code, name: name);
    final response = await _client.post('/pair/confirm', body: request);
    return Device.fromJson(response);
  }
}
