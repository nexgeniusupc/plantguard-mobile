import '../../models/device/device.dart';
import '../http/api_client.dart';

class DevicesService {
  final ApiClient _client;

  DevicesService(this._client);

  // TODO: Add support for paginated responses
  Future<List<DeviceListResponseData>> getAll() async {
    final response = await _client.get('/devices');
    final data = response['data'];
    if (data is! List) {
      return [];
    }
    return data.map((json) => DeviceListResponseData.fromJson(json)).toList();
  }

  Future<DeviceMeasurement> getCurrent(String id) async {
    final response = await _client.get('/devices/$id/current');
    return DeviceMeasurement.fromJson(response);
  }
}
