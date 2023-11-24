import 'package:json_annotation/json_annotation.dart';

part 'device.g.dart';

@JsonSerializable()
class Device {
  final String id;
  final String userId;
  final String name;
  final String serialNumber;
  final DateTime createdAt;
  final DateTime updatedAt;

  Device({
    required this.id,
    required this.userId,
    required this.name,
    required this.serialNumber,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceToJson(this);
}

@JsonSerializable()
class DeviceListResponseData {
  final String id;
  final String name;

  DeviceListResponseData({
    required this.id,
    required this.name,
  });

  factory DeviceListResponseData.fromJson(Map<String, dynamic> json) =>
      _$DeviceListResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceListResponseDataToJson(this);
}

@JsonSerializable()
class DeviceMeasurement {
  final double temperature;
  final double humidity;
  final DateTime date;

  DeviceMeasurement({
    required this.temperature,
    required this.humidity,
    required this.date,
  });

  factory DeviceMeasurement.fromJson(Map<String, dynamic> json) =>
      _$DeviceMeasurementFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceMeasurementToJson(this);
}
