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
