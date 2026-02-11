import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Display vs MediaQuery Demo',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const DisplayInfoExample(),
    );
  }
}

class DisplayInfoExample extends StatelessWidget {
  const DisplayInfoExample({super.key});

  @override
  Widget build(BuildContext context) {
    // Display (hardware / physical screen)
    final Display display = View.of(context).display;

    // MediaQuery (UI environment)
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Display vs MediaQuery')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -------- Display info --------
            Text('Display (Physical Screen)', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text('Display ID: ${display.id}'),
            Text(
              'Size (px): '
              '${display.size.width.toInt()} x ${display.size.height.toInt()}',
            ),
            Text('Device Pixel Ratio: ${display.devicePixelRatio}'),
            Text('Refresh Rate: ${display.refreshRate} Hz'),

            const Divider(height: 32),

            // -------- MediaQuery info --------
            Text('MediaQuery (UI Environment)', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(
              'Logical Size (dp): '
              '${mediaQuery.size.width.toInt()} x '
              '${mediaQuery.size.height.toInt()}',
            ),
            Text('Text Scale Factor: ${mediaQuery.textScaleFactor}'),
            Text(
              'Padding (SafeArea): '
              '${mediaQuery.padding}',
            ),
            Text(
              'View Insets (Keyboard): '
              '${mediaQuery.viewInsets}',
            ),
          ],
        ),
      ),
    );
  }
}
