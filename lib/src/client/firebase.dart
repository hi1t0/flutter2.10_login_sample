import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseProvider = Provider.autoDispose((ref) => FirebaseController(ref));

class FirebaseController {
  FirebaseController(this.ref);
  // final Reader read;
  final ref; // 必要？

  final FirebaseAuth _auth = FirebaseAuth.instance;
  // User? currentUser = FirebaseAuth.instance.currentUser;
  Future<User?> getCurrentUser() async {
    return await FirebaseAuth.instance.currentUser;
  }

  // 登録
  Future signUp(email, password) async {
    if (password == null || password.isEmpty) {
      throw ('パスワードを入力して下さい');
    }

    if (email == null || email.isEmpty) {
      throw ('メールアドレスを入力して下さい');
    }

    // todo:
    String? errorMessage;

    try {
      final User? user = (await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      // final email = user.email;
      // FirebaseFirestore.instance.collection('users').doc(user.uid).set(
      //   {
      //     'username': username,
      //     'name': name,
      //     'email': email,
      //     'tel': tel,
      //     'address': address,
      //     'createdAt': Timestamp.now(),
      //   },
      // );
    } on FirebaseAuthException catch (e) {
      authException(errorMessage, e);
    }
  }

  // login
  Future login(email, password) async {
    if (password == null || password.isEmpty) {
      throw ('パスワードを入力して下さい');
    }

    if (email == null || email.isEmpty) {
      throw ('メールアドレスを入力して下さい');
    }

    String? errorMessage;

    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final uid = result.user?.uid;
    } on FirebaseAuthException catch (e) {
      authException(errorMessage, e);
    }
  }

  // signout
  Future signOut() async {
    await _auth.signOut();
  }
}

void authException(errorMessage, e) {
  print('****************************************************************');
  print('error : ${e.code}');
  print('****************************************************************');
  // if (e) throw ('メールアドレス又はパスワードが違います');
  switch (e.code) {
    case "ERROR_EMAIL_ALREADY_IN_USE":
    case "account-exists-with-different-credential":
    case "email-already-in-use":
      errorMessage = "メールアドレスは既に使われています";
      break;
    case "ERROR_WRONG_PASSWORD":
    case "wrong-password":
      errorMessage = "メール又は、パスワードが違います";
      break;
    case "ERROR_USER_NOT_FOUND":
    case "user-not-found":
      errorMessage = "このメールのユーザーは見つかりません";
      break;
    case "ERROR_USER_DISABLED":
    case "user-disabled":
      errorMessage = "ユーザーは使用不可になっています";
      break;
    case "ERROR_TOO_MANY_REQUESTS":
    case "operation-not-allowed":
      errorMessage = "Too many requests to log into this account.";
      break;
    case "ERROR_OPERATION_NOT_ALLOWED":
    case "operation-not-allowed":
      errorMessage = "サーバーエラー, 暫くしてから接続してください";
      break;
    case "ERROR_INVALID_EMAIL":
    case "invalid-email":
      errorMessage = "メールアドレスが違います";
      break;
    case "ERROR_USER_NOT_FOUND":
    case "user-not-found":
      errorMessage = "このメールアカウントは見つかりません";
      break;
    default:
      errorMessage = "メール又は、パスワードが正しくありません";
      break;
  }

  if (errorMessage != null) {
    print('****');
    print('errorMessage : $errorMessage');
    print('****');
    throw (errorMessage);
  }
}
