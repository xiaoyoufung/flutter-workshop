import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Map the iOS Cupertino text theme to Material TextTheme
  TextTheme _cupertinoTextTheme() {
    final cupertinoTextTheme = CupertinoThemeData().textTheme;

    return TextTheme(
      // Large navigation title (iOS-style)
      headlineMedium: cupertinoTextTheme.navLargeTitleTextStyle.copyWith(
        // fixes a small spacing difference between Cupertino & Material
        letterSpacing: -1.5,
      ),

      // Normal navigation title
      titleLarge: cupertinoTextTheme.navTitleTextStyle,

      // Optional: map more styles if needed
      bodyMedium: cupertinoTextTheme.textStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,

        // Use iOS text theme only on iOS
        textTheme: Platform.isIOS ? _cupertinoTextTheme() : null,

        appBarTheme: AppBarTheme(
          // iOS-style AppBar tweaks
          surfaceTintColor: Platform.isIOS ? Colors.transparent : null,
          shadowColor: Platform.isIOS ? CupertinoColors.darkBackgroundGray : null,
          scrolledUnderElevation: Platform.isIOS ? 0.1 : null,
          toolbarHeight: Platform.isIOS ? 44 : null,
          centerTitle: Platform.isIOS,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Adaptive AppBar')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Large Title', style: textTheme.headlineMedium),
            const SizedBox(height: 16),
            Text('This text uses iOS typography when running on iOS.', style: textTheme.bodyMedium),
            const SizedBox(height: 32),
            Text('Platform: ${Platform.isIOS ? "iOS" : "Other"}', style: textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}
