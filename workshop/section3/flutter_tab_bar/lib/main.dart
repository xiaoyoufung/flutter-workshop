import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const PlatformThemeApp());
}

class PlatformThemeApp extends StatelessWidget {
  const PlatformThemeApp({super.key});

  bool get isIOS {
    if (kIsWeb) return false;
    return Platform.isIOS;
  }

  @override
  Widget build(BuildContext context) {
    // Map Material text styles to Cupertino text styles
    final TextTheme cupertinoTextTheme = TextTheme(
      headlineMedium: const CupertinoThemeData().textTheme.navLargeTitleTextStyle
      // Fix spacing issue
      .copyWith(letterSpacing: -1.5),
      titleLarge: const CupertinoThemeData().textTheme.navTitleTextStyle,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,

        // Apply Cupertino text theme only on iOS
        textTheme: isIOS ? cupertinoTextTheme : null,

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  bool get isIOS {
    if (kIsWeb) return false;
    return Platform.isIOS;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Platform Adaptive App"),

        // iOS-specific AppBar adjustments
        surfaceTintColor: isIOS ? Colors.transparent : null,
        shadowColor: isIOS ? CupertinoColors.darkBackgroundGray : null,
        scrolledUnderElevation: isIOS ? 0.1 : null,
        toolbarHeight: isIOS ? 44 : null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text("Large Title Example", style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 16),
            Text("Navigation Title Example", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 24),
            const Text(
              "This screen adapts text styles and AppBar "
              "behavior based on the running platform.",
            ),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: () {}, child: Text(isIOS ? "iOS Styled Button" : "Material Button")),
          ],
        ),
      ),
    );
  }
}
