# random_user
[![Flutter version](https://img.shields.io/badge/flutter-stable-blue?logo=flutter)](https://flutter.dev/docs/development/tools/sdk/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)

Random User is a Flutter App designed to fetch random user data, explore user details, and search for a specific number of users. Whether it's an iOS or Android device, this app is optimized to deliver a seamless experience. The app demonstrates how to implement Flutter Clean Architecture with Riverpod, local cache, and RESTful API integration.


## Production level implementations

- CI/CD with [GitHub Actions](https://github.com/features/actions)
- Unit Test 

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

# Technologies
- Flutter 🦋
- Dart 💻
- Sqflite for local cache 💽 
- http 🌐
- Clean Architecture 🔨
- GoRoute for Navigation 🗺️
- Riverpod / Bloc for State Managment 🚀
- Optimized for iOS and Android 📱

<p align="left">
  <img width="200" alt="iPhone13ProMockup1" src="https://github.com/IsaiasCuvula/Flutter-Developer-Portfolio/assets/68303716/cc91b099-ba3b-49ad-95bd-9120d91b80b4" />
  <img width="200" alt="iPhone13ProMockup2" src="https://github.com/IsaiasCuvula/Flutter-Developer-Portfolio/assets/68303716/cd1d7623-c6ff-4e68-a9ea-090e0eb28de8" />
  <img width="200" alt="iPhone13ProMockup3" src="https://github.com/IsaiasCuvula/Flutter-Developer-Portfolio/assets/68303716/92271687-cc3b-4b98-ab4a-4626eb957042" />
  <img width="200" alt="iPhone13ProMockup4" src="https://github.com/IsaiasCuvula/Flutter-Developer-Portfolio/assets/68303716/a41db874-2aa0-4e82-a071-c3e61668c83a" />
</p>

Key Features:

🔨 Clean Architecture: Random User App follows a clean architecture pattern, ensuring separation of concerns and maintainability. The codebase is organized and modularized, promoting scalability and extensibility for future enhancements.

🌐 HTTP Integration: Random User App integrates HTTP requests to fetch user data from external APIs. This enables real-time updates and guarantees the availability of the latest user profiles.

💽 Sqflite for Local Cache: Random User App utilizes Sqflite, a powerful and reliable local database solution. This allows caching and storage of user data, so there is always something to see even when the device is not connected to the internet.

🗺️ GoRoute for Navigation: With GoRoute navigation library, UserFetcher delivers a smooth and intuitive navigation experience. Seamlessly switch between screens, and explore user profiles.

🚀 Riverpod for State Management: UserFetcher utilizes either Riverpod or Bloc, two popular state management solutions. These robust libraries ensure efficient state handling, enabling a responsive and interactive app experience.

🔀 Fetch Random User: Get a Random user as soon you open the App.

🔍 User Details Viewer: Gain in-depth insights into specific user profiles. View comprehensive details, including personal information, contact details, profile pictures, and more. You can make call or send email to the user, the app use default device app to make call or send email. 

📊 Display list of Users: fetch custom random users, based on the specified quantity.


