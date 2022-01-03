# flutter_ci_test

App for testing github actions workflow.

![](https://github.com/zavenco/flutter-ci-test/workflows/Flutter%20CI%2FCD/badge.svg)

## Languages, libraries and tools used

### Languages

* English

### Libraries and tools (versions are described in [pubspec](pubspec.yaml))

* [equatable](https://pub.dev/packages/equatable)
* [json_annotation](https://pub.dev/packages/json_annotation)
* [json_serializable](https://pub.dev/packages/json_serializable)
* [build_runner](https://pub.dev/packages/build_runner)
* [flutter_flavorizr](https://pub.dev/packages/flutter_flavorizr)

## Requirements

* JDK 1.8
* [Android SDK](https://developer.android.com/studio/index.html)
* Android ([API 23 to 31](https://developer.android.com/studio/releases/platforms))
* Android SDK Tools and build tools 31 or newer.
* Xcode
* iOS 12.0 or newer
* Dart 2.15.1
* Flutter SDK from stable channel v2.8.1

## How to run app on development environment

- `flutter packages get`

Before running an application you need to generate code running following command line:

- `flutter pub run build_runner build --delete-conflicting-outputs`

and then you can run application

- `flutter run -t lib/main_development.dart --debug --flavor development --dart-define=DEFINE_API_BASE_URL=PASTE_API_URL_HERE`

Remember to provide build flavor at `Run\Debug Configurations` in Android Studio

### Continuous Integration and Deployment

CI and CD are performed using Github Actions. [Here](.github/workflows/flutter-ci.yml) you can see configuration file.

### Environment variables:

- Services accounts
    - `CI_TEST_FIREBASE_SERVICE_ACCOUNT_PRODUCTION`
    - `CI_TEST_FIREBASE_SERVICE_ACCOUNT_STAGING`
    - `CI_TEST_FIREBASE_SERVICE_ACCOUNT_DEVELOPMENT`
- Firebase application id
    - `CI_TEST_ANDROID_FIREBASE_APP_ID_PRODUCTION`
    - `CI_TEST_ANDROID_FIREBASE_APP_ID_STAGING`
    - `CI_TEST_ANDROID_FIREBASE_APP_ID_DEVELOPMENT`
    - `CI_TEST_IOS_FIREBASE_APP_ID_PRODUCTION`
    - `CI_TEST_IOS_FIREBASE_APP_ID_STAGING`
    - `CI_TEST_IOS_FIREBASE_APP_ID_DEVELOPMENT`
- Upload Key (keystore)
    - `KEYSTORE_KEY_ALIAS`
    - `KEYSTORE_KEY_PASSWORD`
    - `KEYSTORE_STORE_PASSWORD`
    - `UPLOAD_KEYSTORE_FILE`
- Play Store publisher account json key
    - `CI_TEST_GOOGLE_DEVELOPER_SERVICE_ACCOUNT_ACTOR_FASTLANE`
- App store
    - `APP_STORE_CONNECT_API_KEY_ISSUER_ID`
    - `APP_STORE_CONNECT_API_KEY_KEY`
    - `APP_STORE_CONNECT_API_KEY_KEY_ID`
    - `MATCH_PASSWORD`
- API Urls
    - `CI_TEST_API_URL_PRODUCTION`
    - `CI_TEST_API_URL_STAGING`
    - `CI_TEST_API_URL_DEVELOPMENT`

### Environments

We have three different environments:

- `development`
- `staging`
- `production`

For Android application, we are using `productFlavors` to match each of these environments. You can
see configuration [here](/android/app/build.gradle). Each environment is pointing to different
Firebase project and is using different API endpoints.

### Code generation

We are using code generation for [json_serializable](https://pub.dev/packages/json_serializable).

If you are not familiar with this concept I really recommend you to
read [this](https://flutter.dev/docs/development/data-and-backend/json)
and [one-time-code-generation](https://flutter.dev/docs/development/data-and-backend/json#one-time-code-generation)