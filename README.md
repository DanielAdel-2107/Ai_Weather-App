# 🌦️ ai_weather  

A new Flutter project for weather forecasting.  

---

## 🚀 Getting Started  

This project is a starting point for a Flutter application.  

### 📚 Useful Resources:  
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)  
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)  
- [Flutter Documentation](https://docs.flutter.dev/) – Tutorials, samples, and API references  

---

## 📂 Project Structure  

This project follows a **feature-based architecture** with **Clean Architecture** principles, ensuring modularity, scalability, and maintainability.  

### 🔹 **Main Directories & Files**  

#### 🏗 **1. `app/`**  
> Contains the main application entry point.  
- **`my_app.dart`** → The root widget that initializes the app.  

#### 📌 **2. `core/`** *(Shared utilities & global configurations)*  
- **`app_route/`** → Manages navigation and route definitions.  
- **`components/`** → Reusable UI components.  
- **`di/`** *(Dependency Injection)* → Handles dependency injection using **GetIt** or similar tools.  
- **`error/`** → Centralized error handling and exception management.  
- **`helper/`** → Utility functions and helper classes.  
- **`network/`** → Handles API requests and responses.  
- **`utilities/`** *(Common utilities for the app)*:  
  - **`assets/`** → Stores images, icons, and static resources.  
  - **`colors/`** → Centralized color schemes.  
  - **`constants/`** → Global constants.  
  - **`extensions/`** → Dart extensions for better reusability.  
  - **`strings/`** → Stores text strings (useful for localization).  
  - **`styles/`** → Defines global text and UI styles.  
  - **`validators/`** → Utilities for form validation.  

#### 🔥 **3. `features/`** *(Feature-based structure using Clean Architecture)*  

##### 🛂 **Authentication Module (`auth/`)**  
- **`data/`** → Manages local storage, API calls, and repositories.  
- **`domain/`** → Business logic, entities, and use cases.  
- **`presentation/`** → UI components and state management:  
  - **`controller/`** → Manages app state with `BLoC` or other state management tools.  
  - **`forget_password/`** → Handles password recovery logic.  
  - **`sign_in/`** → Manages sign-in logic.  
  - **`sign_up/`** → Manages sign-up logic.  
  - **`screens/`** → UI screens for authentication.  
  - **`widgets/`** → Reusable UI widgets.  

##### ⛅ **Weather Forecast Module (`forecast/`)**  
- **`data/`** → Fetches and manages weather data.  
- **`domain/`** → Business logic and weather-related use cases.  
- **`presentation/`** → UI components and state management for weather screens.  

#### 🎬 **4. `splash/`**  
- Contains splash screen logic and UI.  

#### 🛠 **5. Other Files & Folders**  
- **`firebase_options.dart`** → Firebase integration configuration.  
- **`main.dart`** → The main application entry point.  
- **`linux/`, `macos/`, `windows/`, `web/`** → Platform-specific configurations.  
- **`test/`** → Contains unit and widget tests.  

---

## ✅ **Why This Structure?**  
✔ **Separation of Concerns** – Keeps UI, business logic, and data layers independent.  
✔ **Scalability & Maintainability** – Easily extend and manage features.  
✔ **Testability** – Clear distinctions between components improve test coverage.  

# Project Demo Video  
[🎥 Watch Demo](https://drive.google.com/file/d/1yohqjvDsiaVDYLwC0wLiJbeEYV9lZW0s/view)
