import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

/**
 * entity
 */
@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    String? loginPassword,
    String? loginEmail,
    String? signupPassword,
    String? signupEmail,
  }) = _AuthState;
  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
}
