import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_sample_20220219/src/repository/auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../client/firebase.dart';
import '../entity/auth.dart';

/**
 * provider
 */
// final authStateControllerProvider =
//     StateNotifierProvider.autoDispose<AuthStateController, AuthState>(
//         (ref) => AuthStateController(ref));
final authStateControllerProvider =
    StateNotifierProvider.autoDispose<AuthStateController, AuthState>((ref) {
  // print()でdisposeのタイミングを可視化する
  ref.onDispose(() => print('authStateControllerProvider dispose'));
  return AuthStateController(ref);
});

class AuthStateController extends StateNotifier<AuthState> {
  AuthStateController(this._ref) : super(const AuthState());

  final _ref;

  Future<User?> getCurrentUser() async {
    return await _ref.watch(authRepository).getUser();
  }

  Future signUp(email, password) async {
    await _ref.watch(authRepository).saveUser(email, password);
  }

  Future signOut() async {
    await _ref.watch(firebaseProvider).signOut();
  }

  Future login(email, password) async {
    await _ref.watch(firebaseProvider).login(email, password);
  }

  setLoginEmailText(text) {
    state = state.copyWith(loginEmail: text);
  }

  setLoginPasswordText(text) {
    state = state.copyWith(loginPassword: text);
  }

  setSignupEmailText(text) {
    state = state.copyWith(signupEmail: text);
  }

  setSignupPasswordText(text) {
    state = state.copyWith(signupPassword: text);
  }
}
