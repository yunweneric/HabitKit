# HabitKit 📱

A modern, cross-platform habit tracking application built with Flutter that demonstrates the power of converting mobile applications into web presentations.

## 🚀 Features

- **Cross-Platform**: Works on iOS, Android, Web, and Desktop
- **Beautiful UI**: Modern Material Design 3 with custom dark theme
- **Category Management**: Organize habits by categories like Fitness, Health, Study, Work, and more
- **Animated Interfaces**: Smooth animations for category selection and habit lists
- **State Management**: Built with BLoC pattern for robust state management
- **Device Preview**: Built-in device preview for testing different screen sizes
- **Vector Graphics**: Optimized SVG assets for crisp visuals

## 🎯 Purpose

HabitKit serves as a demonstration project showcasing how Flutter applications can be seamlessly converted from mobile to web presentations while maintaining a native feel and performance across all platforms.

## 🛠️ Tech Stack

- **Framework**: Flutter 3.5.3+
- **State Management**: BLoC (Business Logic Component)
- **UI Components**: Material Design 3
- **Vector Graphics**: Vector Graphics package for optimized SVG rendering
- **Device Preview**: Device Preview for responsive testing
- **Fonts**: Google Fonts (Atkinson Hyperlegible)

## 📱 Screenshots

<table width="100%">
<tr>
<td align="center" width="25%">
<img src="https://github.com/user-attachments/assets/b7c85395-2a39-40e4-acfe-60dd73c00b0d" alt="Main Screen - Habit List" style="width: 100%; max-width: 400px; height: auto;">
<br><strong>Main Screen - Habit List</strong>
</td>
<td align="center" width="25%">
<img src="https://github.com/user-attachments/assets/05ff14b9-3c6a-4946-ba33-aeaafeb5b372" alt="Category Selection" style="width: 100%; max-width: 400px; height: auto;">
<br><strong>Category Selection</strong>
</td>
<td align="center" width="25%">
<img src="https://github.com/user-attachments/assets/98b8fc1b-30b0-4fb7-a9c0-884779ab6263" alt="Add New Habit" style="width: 100%; max-width: 400px; height: auto;">
<br><strong>Add New Habit</strong>
</td>
<td align="center" width="25%">
<img src="https://github.com/user-attachments/assets/292afbdb-a50f-478c-ad4f-2cca16e7a21d" alt="Habit Details" style="width: 100%; max-width: 400px; height: auto;">
<br><strong>Habit Details</strong>
</td>
</tr>
</table>

## 🏗️ Project Structure

```
lib/
├── main.dart                 # App entry point with device preview
├── home.dart                 # Main home screen
├── addnewhabit.dart          # Add new habit screen
├── bloc_observer.dart        # BLoC observer for debugging
├── cubit/                    # State management
│   ├── filter_habit_category/
│   └── selecte_category/
├── model/                    # Data models
│   ├── category.dart
│   └── habit.dart
├── utils/                    # Utilities and constants
│   ├── assets.dart
│   ├── colors.dart
│   ├── extensions.dart
│   ├── functions.dart
│   └── global_variables.dart
└── widgets/                  # Reusable UI components
    ├── add_category_card.dart
    ├── animated_category_list.dart
    ├── animated_habit_list.dart
    ├── build_bottom_nav_bar.dart
    ├── category_card.dart
    ├── habit.dart
    └── input_text_field.dart
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.5.3 or higher
- Dart SDK
- Android Studio / VS Code
- iOS Simulator (for iOS development)

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/yourusername/habitkit.git
   cd habitkit
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the application**

   ```bash
   # For mobile
   flutter run

   # For web
   flutter run -d chrome

   # For desktop
   flutter run -d macos  # or windows, linux
   ```

## 🎨 Customization

### Adding New Categories

Edit `lib/model/category.dart` to add new habit categories:

```dart
HabitCategoryModel(
  svgAsset: Appassets.your_icon,
  name: 'Your Category',
),
```

### Adding New Habits

Edit `lib/model/habit.dart` to add predefined habits:

```dart
HabitModel(
  category: const ['Your Category'],
  primaryHexColor: AppColors.yourColor,
  secondaryHexColor: AppColors.yourSecondaryColor,
  subtitle: 'Your habit description',
  svgAsset: Appassets.your_icon,
  title: 'Your Habit',
),
```

## 🌐 Web Deployment

The application is optimized for web deployment and includes device preview functionality for testing responsive design across different screen sizes.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📞 Support

If you have any questions or need support, please open an issue on GitHub.

---

**Built with ❤️ using Flutter**
