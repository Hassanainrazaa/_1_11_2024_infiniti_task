import 'package:_1_11_2024_infiniti/provider/theme_provider.dart';
import 'package:_1_11_2024_infiniti/src/common_widgets/custom_drawer_widget.dart';

import 'package:_1_11_2024_infiniti/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:_1_11_2024_infiniti/provider/drawer_provider.dart'; // Add other providers here

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    // DevicePreview(
    //   enabled: true, // Set to false to disable Device Preview
    //builder: (context) =>
    const MyApp(),
    //),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(create: (_) => ThemeNotifier()),
        ChangeNotifierProvider<DrawerProvider>(create: (_) => DrawerProvider()),
      ],
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Themed App',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeNotifier.themeMode, // Apply theme mode
            home: const CustomDrawerWidget(),
          );
        },
      ),
    );
  }
}
