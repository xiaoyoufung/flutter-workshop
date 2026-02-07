import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: "Responsive Layout Demo",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Large screens (tablet on landscape mode, desktop, TV)
          if (constraints.maxWidth > 600) {
            return Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: 100,
                      width: constraints.maxWidth * 0.75,
                      color: Colors.blueAccent,
                      child: const Center(child: Text('Header')),
                    ),
                    Container(
                      height: 300,
                      width: constraints.maxWidth * 0.75,
                      color: Colors.amber,
                      child: const Center(child: Text('Main Content')),
                    ),
                    Container(
                      height: constraints.maxHeight - 400,
                      width: constraints.maxWidth * 0.75,
                      color: Colors.lightGreen,
                      child: const Center(child: Text('Footer')),
                    ),
                  ],
                ),
                Container(
                  width: constraints.maxWidth * 0.25,
                  height: constraints.maxHeight,
                  color: Colors.pink,
                  child: const Center(child: Text('Right Sidebar')),
                ),
              ],
            );
          }

          // Small screens
          return Column(
            children: [
              Container(height: 100, color: Colors.blue, child: const Center(child: Text('Header'))),
              Container(height: 300, color: Colors.amber, child: const Center(child: Text('Main Content'))),
              Container(
                height: constraints.maxHeight - 400,
                color: Colors.lightGreen,
                child: const Center(child: Text('Footer')),
              ),
            ],
          );
        },
      ),
    );
  }
}
