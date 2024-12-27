import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitkit/bloc_observer.dart';
import 'package:habitkit/home.dart';
import 'package:habitkit/utils/extensions.dart';

import 'cubit/filter_habit_category/filter_habit_category_cubit.dart';
import 'cubit/selecte_category/selected_categories_cubit.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  ((kDebugMode || kProfileMode) && !kIsWeb)
      ? runApp(const MyApp())
      : runApp(DevicePreview(
          backgroundColor: Colors.white,
          // Enable preview by default for web demo
          enabled: true,
          // Start with Galaxy A50 as it's a common Android device
          defaultDevice: Devices.ios.iPhone13ProMax,
          // Show toolbar to let users test different devices
          isToolbarVisible: true,
          // Keep English only to avoid confusion in demos
          availableLocales: const [Locale('en', 'US')],
          tools: const [
            // Device selection controls
            DeviceSection(
              model: true, // Option to change device model to fit your needs
              orientation: false, // Lock to portrait for consistent demo
              frameVisibility: false, // Hide frame options
              virtualKeyboard: false, // Hide keyboard
            ),
            // Theme switching section
            // SystemSection(
            //   locale: false, // Hide language options - we're keeping it English only
            //   theme: false, // Show theme switcher if your app has dark/light modes
            // ),
            // Disable accessibility for demo simplicity
            // AccessibilitySection(
            //   boldText: false,
            //   invertColors: false,
            //   textScalingFactor: false,
            //   accessibleNavigation: false,
            // ),
            // Hide extra settings to keep demo focused
            // SettingsSection(
            //   backgroundTheme: false,
            //   toolsTheme: false,
            // ),
          ],
          // Curated list of devices for comprehensive preview
          devices: [
            ...Devices.all,
          ],
          builder: (context) {
            return const MyApp();
          },
        ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SelectedCategoriesCubit(),
          ),
          BlocProvider(
            create: (context) =>
                FilterHabitCategoryCubit()..loadHabitCategories(),
          ),
        ],
        child: MaterialApp(
          title: 'HabitKit',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: HexColor.toHexColor('#151517'),
            appBarTheme: AppBarTheme(
              color: HexColor.toHexColor('#151517'),
              elevation: 0,
              surfaceTintColor: HexColor.toHexColor('#151517'),
            ),
            useMaterial3: true,
          ),
          home: const Home(),
        ));
  }
}
