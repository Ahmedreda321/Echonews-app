# EchoNews 📰

[![Flutter](https://img.shields.io/badge/Flutter-3.19-blue?logo=flutter)](https://flutter.dev)
[![BLoC](https://img.shields.io/badge/State%20Management-BLoC-ff69b4)](https://bloclibrary.dev)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

A modern Flutter news app with offline support, delivering curated articles across multiple categories with a clean, responsive interface.

## ✨ Key Features

- **📱 Multi-Category News**: Technology, Business, Entertainment, Health, Science & Sports
- **📶 Offline Mode**: Read cached news without internet
- **🎨 Custom UI**: Material 3 design with dynamic theming
- **⚡ Performance**: Optimized with BLoC state management
- **🔒 Secure Storage**: Encrypted local data persistence

## 🏗 Project Structure

```
lib/
├── core/
│   ├── constants
│   ├── di
│   ├── network
│   ├── errors
│   ├── utils
│   ├── services
│   ├── theme
│   └── extensions
├── features/
│   └── home/ 
│       ├── data/ 
│       │    └── datasources/ 
│       │        ├── mapper/
│       │        ├── models/
│       │        └── repositories/
│       └── presentation/
│           ├── cubit/
│           ├── models/
│           ├── screens/
│           └── widgets/
│ 
│      
├── echonews.dart
└── main.dart
```
## 📦 Core Packages

| Package | Usage |
|---------|-------|
| `flutter_bloc` | State management |
| `dio` + `retrofit` | API communication |
| `shared_preferences` | Local storage |

### Installation
```bash
git clone https://github.com/Ahmedreda321/Echonews-app
cd Echonews-app
flutter pub get
```
