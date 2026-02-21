import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const AdaptiveTextFieldApp());
}

class AdaptiveTextFieldApp extends StatelessWidget {
  const AdaptiveTextFieldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const AdaptiveTextFieldScreen(),
    );
  }
}

class AdaptiveTextFieldScreen extends StatelessWidget {
  const AdaptiveTextFieldScreen({super.key});

  bool get isIOS {
    if (kIsWeb) return false;
    return Platform.isIOS;
  }

  Widget _createAdaptiveTextField() {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: CupertinoColors.lightBackgroundGray),
      borderRadius: BorderRadius.circular(6),
    );

    final iOSDecoration = InputDecoration(
      border: border,
      enabledBorder: border,
      focusedBorder: border,
      filled: true,
      fillColor: CupertinoColors.white,
      hoverColor: CupertinoColors.white,
      contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
    );

    return isIOS
        ? SizedBox(
          height: 36.0, // iOS standard height
          child: TextField(decoration: iOSDecoration),
        )
        : const TextField(decoration: InputDecoration(labelText: "Enter text"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Adaptive TextField Example")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Adaptive Input Field", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 16),
            _createAdaptiveTextField(),
            const SizedBox(height: 24),
            Text(isIOS ? "Running on iOS → Cupertino styled TextField" : "Running on Android/Web → Material TextField"),
          ],
        ),
      ),
    );
  }
}
