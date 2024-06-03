## README - Flutter Posts App

### Project Description

This Flutter application implements a simplified Clean Architecture and MVVM to display a list of posts and navigate to a detail screen with their associated comments. The app uses Riverpod as a state manager and dependency locator, Dio as a REST client, and Mocktail for unit test mocks.

### App in action

https://github.com/matiasilveiro/flutter_challenge_pinapp/assets/8867806/a798fbde-ac5f-4c7e-b448-3f3c32a13322

### Features

* Displays a list of posts fetched from the JSONPlaceholder API.
* Allows navigation to a detail screen for each post.
* Shows the comments associated with each post.

### Architecture

The application follows the principles of Clean Architecture and MVVM to separate concerns and improve testability. However, in this solution, a simplified implementation of Clean Architecture has been chosen to avoid over-engineering.

* **Clean Architecture:**
    * **Entities:** Represent the domain data, independent of the implementation.
    * **Use Cases:** Define the business logic, without depending on the technology or the user interface.
    * **Interfaces:** Define the communication interfaces between layers, without implementing the logic.
    * **Implementations:** Implement the logic of the interfaces, using specific technologies.
* **MVVM (implemented with Riverpod):**
    * **Model:** Represents the application data.
    * **ViewModel:** Exposes the data and business logic to the view, handling user interaction. It is implemented using Riverpod's `AsyncNotifier` and `Notifier` classes.
    * **View:** Displays the user interface and communicates with the ViewModel.

![](https://miro.medium.com/v2/resize:fit:720/format:webp/1*h4ahfMrkEhwmx5_Y6Y7zOA.png)

### Technologies Used

* **Flutter:** Multi-platform mobile application development framework.
* **Dart:** Official programming language for Flutter.
* **Clean Architecture (simplified):** Architectural pattern for organizing code in a modular and testable way.
* **MVVM (implemented with Riverpod):** Design pattern to separate the view from the model and business logic.
* **Riverpod:** State manager and dependency locator based on Provider.
* **Dio:** HTTP client for making requests to REST APIs.
* **Alamofire:** HTTP client for making requests to REST APIs on iOS.
* **Mocktail:** Library for creating object mocks in Dart.

**Dependencies**

* Flutter >= 3.10.0
* Dart >= 3.3.0
* Riverpod >= 2.5.1
* Dio >= 5.4.3
* Mocktail >= 1.0.3

**Instructions for Use**

1. Clone the repository: `git clone https://github.com/repository`
2. Install dependencies: `flutter pub get`
3. Run the application: `flutter run`

### Notes

* The application is configured to work on iOS and Android.
* Unit test mocks are implemented using Mocktail. However, the code is missing many unit tests.
* It is recommended to read the source code to better understand the implementation of the architecture and technologies used.
* The error handling for the Repository calls is delegated to Riverpod's `AsyncValue` class and its straightforward usage. However, better error handling both in UI and in code is missing.
* **The implementation of Clean Architecture in this solution has been simplified to avoid over-engineering, by not creating UseCases and using the `PostsRepository` directly.**

## Contact

Do you have any questions or comments? Feel free to contact me!

**Matias Silveiro**
matias.silveiro@gmail.com

**I hope you like this app!**
