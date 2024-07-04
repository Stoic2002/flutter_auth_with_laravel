# Flutter Auth App

A simple Flutter application demonstrating authentication implementation using the BLoC pattern and integration with a Laravel backend.

## Features

- User registration
- User login
- User logout
- Token storage using SharedPreferences
- State management using the BLoC pattern
- Integration with a Laravel backend

## Technologies Used

- Flutter
- `flutter_bloc` for state management
- `http` for API calls
- `shared_preferences` for local storage
- Laravel (backend)

## Getting Started

### Prerequisites

- Flutter SDK
- A running instance of the Laravel backend with authentication routes

### Installation

1. **Clone the repository**:
    ```sh
    git clone https://github.com/Stoic2002/flutter_auth_with_laravel.git
    cd flutter_auth_with_laravel
    ```

2. **Install dependencies**:
    ```sh
    flutter pub get
    ```

3. **Set up Laravel backend**:
    Follow the instructions in the Laravel backend repository to set up and run the server.

4. **Configure API URL**:
    Update the API URL in the Flutter app to point to your Laravel backend.

### Running the App

1. **Run on a device or emulator**:
    ```sh
    flutter run
    ```

## Usage

### Registration

- Open the app and navigate to the registration screen.
- Enter the required details and submit to register a new user.

### Login

- Open the app and navigate to the login screen.
- Enter your credentials and submit to log in.
- Upon successful login, a token will be stored locally using SharedPreferences.

### Logout

- Use the logout option to clear the stored token and log out the user.

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes.
