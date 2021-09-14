import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_login_sample/src/widget/auth/login_view.dart';
import 'package:flutter_login_sample/src/widget/dialog.dart';
import 'package:flutter_login_sample/src/widget/home_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpView extends HookWidget {
  static const routeName = '/signup';

  final dialog = MyDialog();

  @override
  Widget build(BuildContext context) {
    final asp = useProvider(authStateControllerProvider.notifier);
    final authState =
        useProvider(authStateControllerProvider.select((value) => value));

    final mailController = TextEditingController(text: authState.email ?? '');
    final passwordController =
        TextEditingController(text: authState.password ?? '');

    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
        actions: [
          TextButton(
            child: Text('登録', style: TextStyle(color: Colors.white)),
            // icon: const Icon(Icons.add),
            onPressed: () async {
              try {
                await asp.signUp(authState.password, authState.email);
                await dialog.show(context, '登録完了しました');
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeView()));
              } catch (e) {
                dialog.show(context, e.toString());
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Text(
                  ' ＊ ',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width -
                      MediaQuery.of(context).size.width / 5,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(hintText: 'メールアドレスを入力してください'),
                    controller: mailController,
                    onChanged: (text) {
                      asp.setMailText(text);
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  ' ＊ ',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width -
                      MediaQuery.of(context).size.width / 5,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(hintText: 'パスワードを入力してください'),
                    obscureText: true,
                    controller: passwordController,
                    onChanged: (text) {
                      asp.setPasswordText(text);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
