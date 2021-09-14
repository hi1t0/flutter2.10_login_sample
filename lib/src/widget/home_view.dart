import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_login_sample/src/sample_feature/sample_item_list_view.dart';
import 'package:flutter_login_sample/src/widget/auth/login_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends HookWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final asp = useProvider(authStateControllerProvider.notifier);
    final authState =
        useProvider(authStateControllerProvider.select((value) => value));

    useEffect(() {
      // user情報がないのならログインページへ
      final user = asp.getCurrentUser();
      if (user == null)
        Future.microtask(() async {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LogInView()));
        });
      return () {};
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  child: Text('サンプルリスト'),
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SampleItemListView()));
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  child: Text(
                    'ログアウト',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    await asp.signOut();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LogInView()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
