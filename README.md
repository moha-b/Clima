[![cover](assets/images/Cover.png)](https://www.figma.com/community/file/1023658389987124693/mikoaj-niznik-3d-weather-icons)
# Clima 🌤️
Clima is a user-friendly weather app designed to provide you with accurate and up-to-date weather information in the simplest way possible. With Clima, you can easily check the current temperature in your location for today and the next six days, allowing you to plan your activities accordingly. The app also offers detailed hourly forecasts, providing you with weather updates every three hours throughout the day. Clima's standout feature lies in its minimalistic and intuitive design, ensuring a hassle-free experience for users. Say goodbye to complicated interfaces and overwhelming data—Clima focuses on delivering essential weather information, making it the go-to choice for anyone seeking a straightforward and reliable weather app.

## Installation Instructions: 💣
Before you start, you'll need to obtain API keys from the following services:

- **Google Maps API Key:**
    - Visit the [Google Cloud Console](https://console.cloud.google.com/).
    - Create a new project and enable the Google Maps API.
    - Generate an API key and restrict its usage as needed.
    - To integrate the map with your project, follow the [Configuration](https://pub.dev/packages/google_maps_flutterw)

- **OpenWeather API Key:**
    - Go to the [OpenWeather website](https://openweathermap.org/).
    - Sign up for a free account and generate an API key.

### Setting Up API Keys
1. Clone the repository to your local machine:
```bash
git clone https://github.com/your-username/your-project.git
cd your-project
```
2. In the project directory, create a new file named `.env` to store your API keys:
```
# .env file
GOOGLE_MAPS_API_KEY=your-google-maps-api-key
OPENWEATHER_API_KEY=your-openweather-api-key
```
3. Save the .env file in the root of your Flutter project directory.

**OR**

do what I did, create a dart class containes the keys and add it to `.gitignore` like this :
```dart
class Api {
  static const String key = "your-openweather-api-key";
  static const String googleKey = "your-google-maps-api-key";
}
```

### Running the Flutter Project
Now that you have set up your API keys, you can run the Flutter project on your local machine. Make sure you have Flutter installed. If not, you can follow the official Flutter installation guide.
1. Install project dependencies:
```dart
flutter pub get
```

2. Run the Flutter project:
```dart
flutter run
```
This will launch the Flutter app, allowing you to utilize Google Maps and OpenWeather services within your project.

> **Note**
> Make sure to add the .env file to your `.gitignore` to keep your API keys private and not expose them in your version control system. This ensures the security of your API keys.

## Features ✨
- Current Weather: View the real-time weather conditions for your current location, including temperature, date, and weather description.

- 6-Day Forecast: Plan your week ahead with a 6-day weather forecast. Get insights into the upcoming weather trends, helping you make informed decisions.

- Hourly Updates: Access detailed hourly forecasts, providing weather updates every 3 hours throughout the day. Stay prepared for changing weather conditions.

- Google Maps Integration: Seamlessly integrate Google Maps functionality into the app. Visualize weather data on an interactive map, allowing users to explore different locations.

- Notifications: Receive daily weather notifications to stay informed about significant weather changes. Customize notification preferences for specific weather conditions or time intervals.

- User-Friendly Interface: Experience the simplicity of design. Clima features an intuitive and minimalistic interface, ensuring effortless navigation and quick access to weather information.

- Responsive Design: Enjoy consistent user experience across various devices and screen sizes, including smartphones and tablets.

## Preview 📱
![preview](assets/images/preview.mp4)

## Techniques 🛠️
- Minimum SDK level 21
- Compile SDK Version 33
- Font:
    - Manrope
- Architecture
    - Mvvm
- Dio 
    - A powerful and easy-to-use HTTP client for Flutter and Dart.
- Permission Handler 
    - Flutter plugin for managing permissions on both Android and iOS platforms.
- Geolocator 
    - A Flutter geolocation plugin for Android and iOS, providing easy access to device location services such as GPS and Network.
- Dartz 
    - A functional programming library for Dart and Flutter, offering tools for handling immutable data, errors, and functional programming concepts.
- Flutter Bloc 
    - A predictable state management library that helps implement the BLoC pattern in Flutter applications.
- Get It 
    - A simple Service Locator for Dart and Flutter projects, providing a convenient way to manage and access objects throughout the app.
- Lottie:
    - A Flutter package for displaying animations created with Lottie, a library for Android, iOS, and the web that parses Adobe After Effects animations.
- Iconsax:
    - A collection of high-quality and customizable icons for Flutter projects, offering a wide range of icons to enhance the app's visual appeal.
- Flutter Local Notifications:
    - A Flutter plugin for displaying local notifications on Android and iOS devices. Useful for scheduling and managing notifications within the app.
- Path Provider:
    - A Dart library for retrieving commonly used locations on the filesystem, such as temporary and application-specific directories.
- Equatable:
    - A Dart package that helps in comparing objects for equality in a more convenient way, enhancing the simplicity of value-based equality checks.
- Flutter SVG:
    - An SVG rendering and widget library for Flutter, enabling the display of Scalable Vector Graphics files in Flutter applications.
- Connectivity Plus:
    - A Flutter plugin for monitoring network connectivity, providing information about the device's network status and connection type.
- Google Maps Flutter:
    - A Flutter plugin for integrating Google Maps into Flutter applications, allowing developers to display interactive maps with markers, polylines, and more.


## Contribution Guidelines 🚀
We appreciate your interest in contributing to Clima! Before you start, please take a moment to read our [Contribution Guidelines](.github/CONTRIBUTING.md) for details on how to contribute, code of conduct, and other important information.

Thank you for contributing to Clima! 🌦️