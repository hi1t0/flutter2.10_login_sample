import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../client/firebase.dart';
import '../../provider/auth_provider.dart';
import '../dialog.dart';
import 'home_view.dart';
import 'signup_view.dart';

// part 'login_view.freezed.dart';
// part 'login_view.g.dart';

// /**
//  * entity
//  */
// @freezed
// abstract class AuthState with _$AuthState {
//   const factory AuthState({
//     String? loginPassword,
//     String? loginEmail,
//     String? signupPassword,
//     String? signupEmail,
//   }) = _AuthState;
//   factory AuthState.fromJson(Map<String, dynamic> json) =>
//       _$AuthStateFromJson(json);
// }

// /**
//  * provider
//  */
// // final authStateControllerProvider =
// //     StateNotifierProvider.autoDispose<AuthStateController, AuthState>(
// //         (ref) => AuthStateController(ref));
// final authStateControllerProvider =
//     StateNotifierProvider.autoDispose<AuthStateController, AuthState>((ref) {
//   // print()でdisposeのタイミングを可視化する
//   ref.onDispose(() => print('authStateControllerProvider dispose'));
//   return AuthStateController(ref);
// });

// class AuthStateController extends StateNotifier<AuthState> {
//   AuthStateController(this._ref) : super(const AuthState());

//   final _ref;

//   Future<User?> getCurrentUser() async {
//     return await _ref.watch(authProvider).getCurrentUser();
//   }

//   Future login(email, password) async {
//     await _ref.watch(authProvider).login(email, password);
//   }

//   Future signUp(password, email) async {
//     await _ref.watch(authProvider).signUp(password, email);
//   }

//   Future signOut() async {
//     await _ref.watch(authProvider).signOut();
//   }

//   setLoginEmailText(text) {
//     state = state.copyWith(loginEmail: text);
//   }

//   setLoginPasswordText(text) {
//     state = state.copyWith(loginPassword: text);
//   }

//   setSignupEmailText(text) {
//     state = state.copyWith(signupEmail: text);
//   }

//   setSignupPasswordText(text) {
//     state = state.copyWith(signupPassword: text);
//   }
// }

/**
 * view
 */
class LogInView extends StatefulHookConsumerWidget {
  const LogInView({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  LogInViewState createState() => LogInViewState();
}

// class LogInView extends HookConsumerWidget {
class LogInViewState extends ConsumerState<LogInView> {
  late TextEditingController mailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    // "ref" can be used in all life-cycles of a StatefulWidget.
    // ref.watch(counterProvider);
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(authStateControllerProvider.notifier);
    final authState =
        ref.watch(authStateControllerProvider.select((value) => value));
    // print('state : ${state}');

    useEffect(() {
      // 初期値代入
      mailController = TextEditingController(text: authState.loginEmail ?? '');
      passwordController =
          TextEditingController(text: authState.loginPassword ?? '');

      return () {};
    }, []);

    void pressLogIn() async {
      try {
        await controller.login(authState.loginEmail, authState.loginPassword);
        await MyDialog().show(context, 'ログインしました');
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeView()));
      } catch (e) {
        MyDialog().show(context, e.toString());
      }
    }

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
                    controller.setLoginEmailText(text);
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
                    controller.setLoginPasswordText(text);
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  child: Text('ログイン'),
                  onPressed: () => pressLogIn(),
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
