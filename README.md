# flutter_login_sample_20220219

## firebase, riverpod, hooks
[fvmコマンド](https://www.itcowork.co.jp/blog/?p=5771)

fvmでflutterのバージョン管理
flutterプロジェクト作成

````
% fvm use 2.10.1 --force
% fvm flutter create -t skeleton .
````
````
% fvm flutter cleanしたら
% fvm flutter pub get
````

[.vscode/settings.json追加](https://note.com/_hi/n/nf1a0bc44098f)

このままでは動かないので、Firebaseの設定をしてからfvm flutter runで起動してください。

Firebaseの設定はこちらがわかりやすいです。

・[【Flutter実践】Firebase環境構築と、Firestoreのデータを取得してアプリで表示](https://www.youtube.com/watch?v=IiEsyHiIwxc&t=1329s)

## ****************************************************************

pubspec.yamlにパッケージインストールすると、以下の文でエラーが出る
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
[vscodeを閉じて開き直すと治る](https://stackoverflow.com/questions/64574620/target-of-uri-doesnt-exist-packageflutter-gen-gen-l10n-gallery-localizations)


## freezed生成
fvm flutter pub run build_runner build --delete-conflicting-outputs

## cocoapods
バージョンを上げる
ios/Podfile
platform :ios, '12.0'

pod repo updateでエラー出る時
ターミナルアプリ→右クリック→情報見る→ロゼッタを使用して開くをチェック
sudo gem install cocoapods → pod repo update

## ipaファイル作成
fvm flutter build ios時
```
Error (Xcode): Framework not found Pods_Runner
↓
flutter 2.10.1 → 2.8.1へ変更
変更しなくてもよかった
↓
xcodeでプロジェクトを開く、
TARGETS→Runner→Deployment Infoバージョンを上げる
PROJECT→Runner→Deployment Targetバージョンを上げる
```
```
firebase関連のパッケージを入れた時でやすい↓
ld: framework not found Pods_Runner
    clang: error: linker command failed with exit code 1 (use -v to see invocation)
    note: Using new build system
    note: Planning
    note: Build preparation complete
    note: Building targets in dependency order
↓
xcodeでプロジェクトを開く、
TARGETS→Runner→Deployment Infoバージョンを上げる
PROJECT→Runner→Deployment Targetバージョンを上げる
```
## ipaをiphoneへ
ipaこのAppは、整合性を確認できなかったためインストールできません。
↓
udid登録または、distribution用証明書の期限確認

## fvm flutter run時のエラー
An error was encountered processing the command (domain=NSPOSIXErrorDomain, code=3):
↓
fvm flutter clean, fvm flutter pub get
↓
An error was encountered processing the command (domain=NSPOSIXErrorDomain, code=22):
↓
GoogleService-Info.plistのパスがおかしかったので入れ直したら通った

## ****************************************************************
## ****************************************************************
## ****************************************************************
## ****************************************************************

## 構成
client: api外部通信など
entity: state, db構成
provider: controllerとserviceに分けてもいい。この場合serviceに複雑なロジックを書く → state変更、repository呼び出し、db操作に関係のないclient呼び出し
repository: dbなどの出し入れ操作、主にclient呼び出し
widget/view: 画面表示providerを含める


## ****************************************************************
## ****************************************************************
## ****************************************************************
## ****************************************************************


## Getting Started

This project is a starting point for a Flutter application that follows the
[simple app state management
tutorial](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple).

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Assets

The `assets` directory houses images, fonts, and any other files you want to
include with your application.

The `assets/images` directory contains [resolution-aware
images](https://flutter.dev/docs/development/ui/assets-and-images#resolution-aware).

## Localization

This project generates localized messages based on arb files found in
the `lib/src/localization` directory.

To support additional languages, please visit the tutorial on
[Internationalizing Flutter
apps](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)
