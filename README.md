# EchoNews

EchoNews is a Flutter application that delivers the latest news articles from various sources. The app supports offline reading, category filtering, and provides a modern, responsive user interface.

## Features

- Browse news articles by category (e.g., technology, business, entertainment, health, science, sports)
- Offline mode with cached news for reading without internet
- Custom error handling and loading indicators
- Responsive design for all screen sizes
- Modern UI with custom fonts and themes
- Secure and persistent local storage
- State management using BLoC (flutter_bloc)
- API integration using Dio and Retrofit

## Project Structure

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
