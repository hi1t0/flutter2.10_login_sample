import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../client/firebase.dart';

final authRepository =
    Provider.autoDispose<AuthRepository>((ref) => AuthRepositoryImpl(ref));

abstract class AuthRepository {
  Future<User?> getUser();
  Future<void> saveUser(String email, String password);
}

class AuthRepositoryImpl implements AuthRepository {
  final ref;
  AuthRepositoryImpl(this.ref);

  Future<User?> getUser() async {
    return await ref.watch(firebaseProvider).getCurrentUser();
  }

  Future<void> saveUser(email, password) async {
    await ref.watch(firebaseProvider).signUp(email, password);
  }
}
