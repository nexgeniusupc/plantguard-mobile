// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Device _$DeviceFromJson(Map<String, dynamic> json) => Device(
      id: json['id'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      serialNumber: json['serialNumber'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$DeviceToJson(Device instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'serialNumber': instance.serialNumber,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

DeviceListResponseData _$DeviceListResponseDataFromJson(
        Map<String, dynamic> json) =>
    DeviceListResponseData(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$DeviceListResponseDataToJson(
        DeviceListResponseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

DeviceMeasurement _$DeviceMeasurementFromJson(Map<String, dynamic> json) =>
    DeviceMeasurement(
      temperature: (json['temperature'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$DeviceMeasurementToJson(DeviceMeasurement instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'date': instance.date.toIso8601String(),
    };
