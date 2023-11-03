import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String fullName;
  final String preferredName;
  final String email;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime lastPasswordUpdate;

  const User({
    required this.id,
    required this.fullName,
    required this.preferredName,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.lastPasswordUpdate,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class RegisterRequest {
  final String fullName;
  final String preferredName;
  final String email;
  final String password;

  const RegisterRequest({
    required this.fullName,
    required this.preferredName,
    required this.email,
    required this.password,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}

@JsonSerializable()
class RegisterResponse {
  final bool success;
  final User user;

  const RegisterResponse({required this.success, required this.user});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}

@JsonSerializable()
class LoginRequest {
  final String email;
  final String password;

  const LoginRequest({required this.email, required this.password});

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

@JsonSerializable()
class LoginResponse {
  final String jwt;
  final User user;

  const LoginResponse({required this.jwt, required this.user});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
