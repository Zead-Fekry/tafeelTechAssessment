# tech_assessment

A Flutter application built with Clean Architecture principles, leveraging Cubit (from `flutter_bloc`) for state management and `get_it` for dependency injection.

---

## 🧠 Architecture

This project follows the **Clean Architecture** pattern, separating concerns into:

- `data`: models, datasources, and repository implementations
- `domain`: entities, repositories (abstract), and use cases
- `presentation`: screens, widgets, cubits (Bloc), and UI logic

---

## ✨ Features

- **Splash Screen**
  - A simple startup screen shown before user data loads

- **Get All Users**
  - Fetches a paginated list of users using the [ReqRes API](https://reqres.in)
  - Supports infinite scrolling and shimmer loading effect

- **Get Single User**
  - Shows detailed info about a selected user with:
    - Hero transition animation
    - Centralized user card layout
    - Shimmer loading

---

## 🧰 Tech Stack

| Category            | Package        |
|---------------------|----------------|
| State Management     | `flutter_bloc` |
| Dependency Injection | `get_it`       |
| API Client           | `dio`          |
| Architecture         | Clean Architecture |
| UI Enhancement       | `shimmer`      |

---

## 🔧 Getting Started

1. Clone the repository
2. Run `flutter pub get`
3. Run the app with `flutter run`

Ensure you are using a recent version of Flutter SDK.

---

## 📚 Resources

- [Flutter: Write your first app](https://docs.flutter.dev/get-started/codelab)
- [Flutter Cookbook](https://docs.flutter.dev/cookbook)
- [Bloc Library Docs](https://bloclibrary.dev)
- [GetIt](https://pub.dev/packages/get_it)

