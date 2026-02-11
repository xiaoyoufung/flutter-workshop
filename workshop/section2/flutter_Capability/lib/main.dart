import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(const SidebarCapabilityApp());
}

class SidebarCapabilityApp extends StatelessWidget {
  const SidebarCapabilityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: SidebarPage());
  }
}

class SidebarPage extends StatefulWidget {
  const SidebarPage({super.key});

  @override
  State<SidebarPage> createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  bool expanded = false;

  void expand() => setState(() => expanded = true);
  void collapse() => setState(() => expanded = false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          MouseRegion(
            onEnter: (event) {
              if (event.kind == PointerDeviceKind.mouse) {
                expand();
              }
            },
            onExit: (event) {
              if (event.kind == PointerDeviceKind.mouse) {
                collapse();
              }
            },
            child: GestureDetector(
              onTap: () {
                // Touch users tap instead of hover
                expand();
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: expanded ? 200 : 72,
                color: Colors.blueGrey,
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    _MenuItem(icon: Icons.dashboard, label: 'Dashboard', expanded: expanded),
                    _MenuItem(icon: Icons.settings, label: 'Settings', expanded: expanded),
                  ],
                ),
              ),
            ),
          ),

          // Main content
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: const Text('Main Content Area', style: TextStyle(fontSize: 24)),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool expanded;

  const _MenuItem({required this.icon, required this.label, required this.expanded});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: expanded ? Text(label, style: const TextStyle(color: Colors.white)) : null,
    );
  }
}
