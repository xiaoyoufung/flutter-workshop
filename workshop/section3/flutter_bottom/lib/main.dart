import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const AdaptiveNavigationApp());
}

class AdaptiveNavigationApp extends StatelessWidget {
  const AdaptiveNavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const AdaptiveHomeScreen(),
    );
  }
}

class AdaptiveHomeScreen extends StatefulWidget {
  const AdaptiveHomeScreen({super.key});

  @override
  State<AdaptiveHomeScreen> createState() => _AdaptiveHomeScreenState();
}

class _AdaptiveHomeScreenState extends State<AdaptiveHomeScreen> {
  int _currentIndex = 0;
  late Widget _currentWidget;

  bool get isIOS {
    if (kIsWeb) return false;
    return Platform.isIOS;
  }

  final Map<String, Icon> _navigationItems = {
    'Menu': Icon(
      kIsWeb
          ? Icons.home
          : Platform.isIOS
          ? CupertinoIcons.house_fill
          : Icons.home,
    ),
    'Order': Icon(Icons.adaptive.share),
  };

  @override
  void initState() {
    super.initState();
    _loadScreen();
  }

  void _loadScreen() {
    switch (_currentIndex) {
      case 0:
        _currentWidget = const Center(child: Text("Menu Screen", style: TextStyle(fontSize: 24)));
        break;
      case 1:
        _currentWidget = const Center(child: Text("Order Screen", style: TextStyle(fontSize: 24)));
        break;
      default:
        _currentWidget = const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_navigationItems.keys.elementAt(_currentIndex))),
      body: _currentWidget,
      bottomNavigationBar:
          isIOS
              ? CupertinoTabBar(
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                    _loadScreen();
                  });
                },
                items:
                    _navigationItems.entries
                        .map((entry) => BottomNavigationBarItem(icon: entry.value, label: entry.key))
                        .toList(),
              )
              : NavigationBar(
                selectedIndex: _currentIndex,
                onDestinationSelected: (index) {
                  setState(() {
                    _currentIndex = index;
                    _loadScreen();
                  });
                },
                destinations:
                    _navigationItems.entries
                        .map((entry) => NavigationDestination(icon: entry.value, label: entry.key))
                        .toList(),
              ),
    );
  }
}
