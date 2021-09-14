import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_login_sample/src/client/auth.dart';
import 'package:flutter_login_sample/src/widget/auth/signup_view.dart';
import 'package:flutter_login_sample/src/widget/dialog.dart';
import 'package:flutter_login_sample/src/widget/home_view.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'login_view.freezed.dart';
part 'login_view.g.dart';

/**
 * entity
 */
@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    String? password,
    String? email,
  }) = _AuthState;
  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
}

/**
 * provider
 */
final authStateControllerProvider =
    StateNotifierProvider<AuthStateController, AuthState>(
        (ref) => AuthStateController(ref));

class AuthStateController extends StateNotifier<AuthState> {
  AuthStateController(this.ref) : super(const AuthState());

  final ref;

  User? getCurrentUser() {
    return ref.read(authProvider).currentUser;
  }

  Future login(email, password) async {
    await ref.read(authProvider).login(email, password);
  }

  Future signUp(password, email) async {
    await ref.read(authProvider).signUp(password, email);
  }

  Future signOut() async {
    await ref.read(authProvider).signOut();
  }

  setMailText(text) {
    state = state.copyWith(email: text);
  }

  setPasswordText(text) {
    state = state.copyWith(password: text);
  }
}

/**
 * view
 */
class LogInView extends HookWidget {
  static const routeName = '/login';

  final dialog = MyDialog();

  @override
  Widget build(BuildContext context) {
    final controller = useProvider(authStateControllerProvider.notifier);
    final authState =
        useProvider(authStateControllerProvider.select((value) => value));
    // print('state : ${state}');

    final mailController = TextEditingController(text: authState.email ?? '');
    final passwordController =
        TextEditingController(text: authState.password ?? '');

    return Scaffold(
      appBar: AppBar(
        title: const Text('ログイン'),
        actions: [],
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: EdgeInsets.only(
            top: 8.0,
            left: 8.0,
            right: 8.0,
          ),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  decoration: InputDecoration(hintText: 'example@co.jp'),
                  controller: mailController,
                  onChanged: (text) {
                    controller.setMailText(text);
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  decoration: InputDecoration(hintText: 'パスワード'),
                  obscureText: true,
                  controller: passwordController,
                  onChanged: (text) {
                    controller.setPasswordText(text);
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  child: Text('ログイン'),
                  onPressed: () async {
                    try {
                      await controller.login(
                          authState.email, authState.password);
                      await dialog.show(context, 'ログインしました');
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomeView()));
                    } catch (e) {
                      dialog.show(context, 'メールアドレス又はパスワードが違います');
                    }
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  child: Text('新規登録'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpView()),
                    );
                  },
                ),
              ),
              // Container(
              //   padding: const EdgeInsets.all(8.0),
              //   width: MediaQuery.of(context).size.width,
              //   child: InkWell(
              //     onTap: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => ResetPasswordPage()),
              //       );
              //     },
              //     child: Text(
              //       'パスワードを忘れた方はこちら',
              //       style: TextStyle(color: Colors.blue, fontSize: 12),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
