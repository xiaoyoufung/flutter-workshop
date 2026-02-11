import 'package:flutter/material.dart';

void main() {
  runApp(const HoverDemoApp());
}

class HoverDemoApp extends StatelessWidget {
  const HoverDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: HoverDemoPage());
  }
}

class HoverDemoPage extends StatefulWidget {
  const HoverDemoPage({super.key});

  @override
  State<HoverDemoPage> createState() => _HoverDemoPageState();
}

class _HoverDemoPageState extends State<HoverDemoPage> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Hover Example')),
      body: Center(
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() => isHover = true),
          onExit: (_) => setState(() => isHover = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 200,
            height: 120,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isHover ? Colors.blue : Colors.grey,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [if (isHover) const BoxShadow(blurRadius: 12, offset: Offset(0, 6), color: Colors.black26)],
            ),
            child: Text(
              isHover ? 'Hovering 👆' : 'Hover me',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
