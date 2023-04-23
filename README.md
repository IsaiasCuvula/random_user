# random_user
[![Flutter version](https://img.shields.io/badge/flutter-stable-blue?logo=flutter)](https://flutter.dev/docs/development/tools/sdk/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)

A simple app to demonstrate how to implement Flutter with Clean Architecture, Riverpod or flutter_bloc & RESTful API.

## Installation
- Clone the repo
```sh
git clone https://github.com/IsaiasCuvula/random_user
```

- And then you can use the normal build and run procedure 
```sh
flutter pub get
flutter run
```
- Some files like *.freezed.dart, *.g.dart, *.iconfig.dart are auto generated. If there is any issue from these files just run these command to regenerate them.
```sh
flutter packages pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

<img src="https://user-images.githubusercontent.com/68303716/233746169-053f5908-3382-4290-8cf9-ee825a5561bb.png"/>
