import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../provider/auth_provider.dart';
import '../dialog.dart';
import 'home_view.dart';
import 'login_view.dart';

class SignUpView extends StatefulHookConsumerWidget {
  const SignUpView({Key? key}) : super(key: key);
  static const routeName = '/signup';

  @override
  SignUpViewState createState() => SignUpViewState();
}

class SignUpViewState extends ConsumerState<SignUpView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // "ref" can be used in all life-cycles of a StatefulWidget.
    // ref.watch(counterProvider);
  }

  @override
  Widget build(BuildContext context) {
    final asp = ref.watch(authStateControllerProvider.notifier);

    final email = useState('');
    final password = useState('');

    void pressSignUp() async {
      try {
        await asp.signUp(email.value, password.value);
        await MyDialog().show(context, '登録完了しました');
        // Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (context) => HomeView()));
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => HomeView()), (_) => false);
      } catch (e) {
        MyDialog().show(context, e.toString());
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
        actions: [
          TextButton(
            child: Text('登録', style: TextStyle(color: Colors.white)),
            // icon: const Icon(Icons.add),
            onPressed: () => pressSignUp(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Text(
                    ' ＊ ',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(hintText: 'メールアドレスを入力してください'),
                      controller: emailController,
                      onChanged: (text) {
                        email.value = text;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  Text(
                    ' ＊ ',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(hintText: 'パスワードを入力してください'),
                      obscureText: true,
                      controller: passwordController,
                      onChanged: (text) {
                        password.value = text;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
