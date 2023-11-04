// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pairing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DevicePairFindResponse _$DevicePairFindResponseFromJson(
        Map<String, dynamic> json) =>
    DevicePairFindResponse(
      code: json['code'] as String,
      serialNumber: json['serialNumber'] as String,
    );

Map<String, dynamic> _$DevicePairFindResponseToJson(
        DevicePairFindResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'serialNumber': instance.serialNumber,
    };

DevicePairConfirmRequest _$DevicePairConfirmRequestFromJson(
        Map<String, dynamic> json) =>
    DevicePairConfirmRequest(
      code: json['code'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$DevicePairConfirmRequestToJson(
        DevicePairConfirmRequest instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };
