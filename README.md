# my_todo

Flutter TODO APP

## Getting Started

To get started, you will need to have the following tools installed:

Flutter 3.22.3 • channel stable • https://github.com/flutter/flutter.git
Framework • revision b0850beeb2 (3 weeks ago) • 2024-07-16 21:43:41 -0700
Engine • revision 235db911ba
Tools • Dart 3.4.4 • DevTools 2.34.3

## Set up environment

Get dependencies and generate require files:

```bash
flutter clean
flutter packages pub get
dart run build_runner build --delete-conflicting-outputs
```

## Sign app for release

- Request for the upload key and place it in the android/app folder.
- Request for the key.properties file and place it in the android/ folder.

## Run and build the app
Run the app in release mode:

```bash 
flutter run --release
```

Build the app in release mode:

```bash
flutter build appbundle --no-tree-shake-icons --release
```