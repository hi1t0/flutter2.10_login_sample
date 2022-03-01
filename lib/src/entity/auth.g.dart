// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthState _$$_AuthStateFromJson(Map<String, dynamic> json) => _$_AuthState(
      loginPassword: json['loginPassword'] as String?,
      loginEmail: json['loginEmail'] as String?,
      signupPassword: json['signupPassword'] as String?,
      signupEmail: json['signupEmail'] as String?,
    );

Map<String, dynamic> _$$_AuthStateToJson(_$_AuthState instance) =>
    <String, dynamic>{
      'loginPassword': instance.loginPassword,
      'loginEmail': instance.loginEmail,
      'signupPassword': instance.signupPassword,
      'signupEmail': instance.signupEmail,
    };
