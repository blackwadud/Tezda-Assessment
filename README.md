# Tezda Assessment

This Flutter project is developed for a fintech application and focuses on authentication functionality using modern Flutter packages and APIs.

## Overview

The project utilizes Flutter for building a cross-platform mobile application. It includes features for user registration, login, and fetching current user details. Below are the key components of the project:

- **Authentication**: Includes functionalities for user registration (`Register`), user login (`Login`), and fetching current user information (`User`).
- **State Management**: Implemented using Riverpod for efficient and scalable state management in Flutter applications.
- **API Communication**: Utilizes the `http` package for making HTTP requests to interact with backend APIs.
- **Logging**: Integrates the `logger` package for logging errors and other messages during API interactions.
- **Dependency Management**: Managed using Flutter's built-in package management system and `pubspec.yaml`.

## APIs Used

The application interacts with the following backend APIs:

- **Registration API**: Used to register new users. Endpoint: `ApiEndpoints.register`.
- **Login API**: Used for user authentication and login. Endpoint: `ApiEndpoints.login`.
- **Current User API**: Retrieves details of the currently logged-in user. Endpoint: `ApiEndpoints.currentuser`.

## Tools and Dependencies

### Development Tools

- **Flutter SDK**: Provides the development framework for building Android and iOS applications using a single codebase.
- **Dart SDK**: The programming language used for developing Flutter applications.

### Flutter Packages

- **provider**: A state management solution that uses concepts similar to Flutter's `InheritedWidget`, but with improvements for scalability and maintainability.
- **shared_preferences**: For persisting simple data (like access tokens) between app launches.
- **google_fonts**: Provides a collection of fonts that can be easily used in Flutter apps.
- **http**: A package for making HTTP requests and handling responses.
- **logger**: For logging messages, errors, and debugging information in the application.
- **flutter_dotenv**: Allows loading environment variables from a `.env` file into Dart's `const` variables during development.

### Dev Dependencies

- **flutter_test**: Flutter's testing framework for writing and running unit tests for Flutter applications.
- **flutter_lints**: A set of recommended lint rules for Dart and Flutter projects.

## Installation and Usage

To get started with the project:

1. Clone the repository:
   ```bash
   git clone https://github.com/your_username/tezda_assesment.git
   cd tezda_assesment/
   flutter pub get
   flutter run

This README provides a comprehensive overview of the APIs used, development tools, Flutter packages, and instructions for installation and usage of your Flutter project. Adjust the URLs, descriptions, and instructions based on your specific project details as needed.

