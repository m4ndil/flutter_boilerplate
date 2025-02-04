# Clean Architecture & MVVM Flutter Boilerplate

This repository provides a basic Flutter project structure following **Clean Architecture** and the **MVVM (Model-View-ViewModel) pattern**. It includes a `lib/` directory with the fundamental layers and a `pubspec.yaml` file with essential dependencies and asset configurations.

## Project Structure

The `lib/` folder is organized as follows:

```
lib/
│── core/               # Core utilities (e.g., network, database, error handling)
│── data/               # Data sources, models, and repositories
│── domain/             # Business logic, use cases, and entity definitions
│── presentation/       # UI layer (Views, ViewModels, and widgets)
│── main.dart           # Application entry point
```

### Explanation:
- **Core**: Contains base classes for networking, database handling, and other core utilities.
- **Data**: Includes repositories, data sources (local and remote), and models.
- **Domain**: Houses the business logic, including use cases and entity definitions.
- **Presentation**: Manages UI components, ViewModels, and screens using MVVM.

## Dependencies

The `pubspec.yaml` includes essential packages for state management, dependency injection, networking, and local storage. 

### Asset Initialization
Ensure your `pubspec.yaml` contains:

```yaml
flutter:
  assets:
    - assets/images/
    - assets/icons/
```

## Contributing
Feel free to fork the repository and submit pull requests to improve the project.

## License
This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

