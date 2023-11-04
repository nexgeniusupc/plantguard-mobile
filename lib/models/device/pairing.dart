import 'package:json_annotation/json_annotation.dart';

part 'pairing.g.dart';

@JsonSerializable()
class DevicePairFindResponse {
  final String code;
  final String serialNumber;

  const DevicePairFindResponse({
    required this.code,
    required this.serialNumber,
  });

  factory DevicePairFindResponse.fromJson(Map<String, dynamic> json) =>
      _$DevicePairFindResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DevicePairFindResponseToJson(this);
}

@JsonSerializable()
class DevicePairConfirmRequest {
  final String code;
  final String name;

  DevicePairConfirmRequest({required this.code, required this.name});

  factory DevicePairConfirmRequest.fromJson(Map<String, dynamic> json) =>
      _$DevicePairConfirmRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DevicePairConfirmRequestToJson(this);
}
