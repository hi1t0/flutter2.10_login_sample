import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_login_sample/src/widget/home_view.dart';

class ErrorView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('error'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('通信を確認し、アプリを起動し直してください'),
            ElevatedButton(
              child: Text('Root'),
              onPressed: () async {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeView()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
