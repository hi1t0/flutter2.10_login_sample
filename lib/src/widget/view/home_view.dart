import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../provider/auth_provider.dart';
import '../../sample_feature/sample_item_list_view.dart';
import 'login_view.dart';

class HomeView extends StatefulHookConsumerWidget {
  const HomeView({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    // "ref" can be used in all life-cycles of a StatefulWidget.
    // ref.watch(counterProvider);
  }

  @override
  Widget build(BuildContext context) {
    final asp = ref.watch(authStateControllerProvider.notifier);
    final authState =
        ref.watch(authStateControllerProvider.select((value) => value));

    useEffect(() {
      // user情報がないのならログインページへ
      Future.microtask(() async {
        final user = await asp.getCurrentUser();
        print('user : ${user}');
        if (user == null)
          // Future.microtask(() async {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LogInView()));
      });
      return () {};
    }, []);

    void pressLogOut() async {
      await asp.signOut();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LogInView()));
    }

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
                  onPressed: () => pressLogOut(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
