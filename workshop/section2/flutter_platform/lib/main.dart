import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const PlatformWorkshopApp());
}

class PlatformWorkshopApp extends StatelessWidget {
  const PlatformWorkshopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: PlatformWorkshopPage());
  }
}

class PlatformWorkshopPage extends StatelessWidget {
  const PlatformWorkshopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Platform Workshop')), body: Center(child: _platformContent()));
  }

  Widget _platformContent() {
    // ✅ Always check Web first
    if (kIsWeb) {
      return const PlatformCard(
        title: 'Web Platform 🌐',
        description: 'Running on Web\nNo Platform.isAndroid / isIOS',
        color: Colors.orange,
      );
    }

    if (Platform.isAndroid) {
      return const PlatformCard(
        title: 'Android Platform 🤖',
        description: 'Material Design\nAndroid behavior',
        color: Colors.green,
      );
    }

    if (Platform.isIOS) {
      return const PlatformCard(
        title: 'iOS Platform 🍎',
        description: 'Cupertino style\niOS behavior',
        color: Colors.blue,
      );
    }

    return const PlatformCard(title: 'Unknown Platform', description: 'Other platform', color: Colors.grey);
  }
}

class PlatformCard extends StatelessWidget {
  final String title;
  final String description;
  final Color color;

  const PlatformCard({super.key, required this.title, required this.description, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(description, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
