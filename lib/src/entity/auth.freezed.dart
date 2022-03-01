// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthState _$AuthStateFromJson(Map<String, dynamic> json) {
  return _AuthState.fromJson(json);
}

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  _AuthState call(
      {String? loginPassword,
      String? loginEmail,
      String? signupPassword,
      String? signupEmail}) {
    return _AuthState(
      loginPassword: loginPassword,
      loginEmail: loginEmail,
      signupPassword: signupPassword,
      signupEmail: signupEmail,
    );
  }

  AuthState fromJson(Map<String, Object> json) {
    return AuthState.fromJson(json);
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  String? get loginPassword => throw _privateConstructorUsedError;
  String? get loginEmail => throw _privateConstructorUsedError;
  String? get signupPassword => throw _privateConstructorUsedError;
  String? get signupEmail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
  $Res call(
      {String? loginPassword,
      String? loginEmail,
      String? signupPassword,
      String? signupEmail});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;

  @override
  $Res call({
    Object? loginPassword = freezed,
    Object? loginEmail = freezed,
    Object? signupPassword = freezed,
    Object? signupEmail = freezed,
  }) {
    return _then(_value.copyWith(
      loginPassword: loginPassword == freezed
          ? _value.loginPassword
          : loginPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      loginEmail: loginEmail == freezed
          ? _value.loginEmail
          : loginEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      signupPassword: signupPassword == freezed
          ? _value.signupPassword
          : signupPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      signupEmail: signupEmail == freezed
          ? _value.signupEmail
          : signupEmail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(
          _AuthState value, $Res Function(_AuthState) then) =
      __$AuthStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? loginPassword,
      String? loginEmail,
      String? signupPassword,
      String? signupEmail});
}

/// @nodoc
class __$AuthStateCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(_AuthState _value, $Res Function(_AuthState) _then)
      : super(_value, (v) => _then(v as _AuthState));

  @override
  _AuthState get _value => super._value as _AuthState;

  @override
  $Res call({
    Object? loginPassword = freezed,
    Object? loginEmail = freezed,
    Object? signupPassword = freezed,
    Object? signupEmail = freezed,
  }) {
    return _then(_AuthState(
      loginPassword: loginPassword == freezed
          ? _value.loginPassword
          : loginPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      loginEmail: loginEmail == freezed
          ? _value.loginEmail
          : loginEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      signupPassword: signupPassword == freezed
          ? _value.signupPassword
          : signupPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      signupEmail: signupEmail == freezed
          ? _value.signupEmail
          : signupEmail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthState implements _AuthState {
  const _$_AuthState(
      {this.loginPassword,
      this.loginEmail,
      this.signupPassword,
      this.signupEmail});

  factory _$_AuthState.fromJson(Map<String, dynamic> json) =>
      _$$_AuthStateFromJson(json);

  @override
  final String? loginPassword;
  @override
  final String? loginEmail;
  @override
  final String? signupPassword;
  @override
  final String? signupEmail;

  @override
  String toString() {
    return 'AuthState(loginPassword: $loginPassword, loginEmail: $loginEmail, signupPassword: $signupPassword, signupEmail: $signupEmail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthState &&
            (identical(other.loginPassword, loginPassword) ||
                const DeepCollectionEquality()
                    .equals(other.loginPassword, loginPassword)) &&
            (identical(other.loginEmail, loginEmail) ||
                const DeepCollectionEquality()
                    .equals(other.loginEmail, loginEmail)) &&
            (identical(other.signupPassword, signupPassword) ||
                const DeepCollectionEquality()
                    .equals(other.signupPassword, signupPassword)) &&
            (identical(other.signupEmail, signupEmail) ||
                const DeepCollectionEquality()
                    .equals(other.signupEmail, signupEmail)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(loginPassword) ^
      const DeepCollectionEquality().hash(loginEmail) ^
      const DeepCollectionEquality().hash(signupPassword) ^
      const DeepCollectionEquality().hash(signupEmail);

  @JsonKey(ignore: true)
  @override
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthStateToJson(this);
  }
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {String? loginPassword,
      String? loginEmail,
      String? signupPassword,
      String? signupEmail}) = _$_AuthState;

  factory _AuthState.fromJson(Map<String, dynamic> json) =
      _$_AuthState.fromJson;

  @override
  String? get loginPassword => throw _privateConstructorUsedError;
  @override
  String? get loginEmail => throw _privateConstructorUsedError;
  @override
  String? get signupPassword => throw _privateConstructorUsedError;
  @override
  String? get signupEmail => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}
