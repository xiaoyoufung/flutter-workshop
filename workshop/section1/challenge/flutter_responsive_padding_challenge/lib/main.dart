import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Responsive Padding Challenge"),),
        body: ResponsiveCard(),
      ),
    );
  }
}

class ResponsiveCard extends StatelessWidget {
  const ResponsiveCard({super.key});

  @override
  Widget build(BuildContext context) {
    // 1️⃣ MediaQuery → full screen info
    // MediaQuery is just for justify what device is this?
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isLargeScreen = screenWidth >= 600;

    return Padding(
      // Padding adjust by the device
      padding: EdgeInsets.all(isLargeScreen ? 32 : 12),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // 2️⃣ LayoutBuilder → actual widget width
          //
          // final boxWidth = constraints.maxWidth;

          // final useVerticalLayout = boxWidth < 600;

          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(children: _contentWidgets(isLargeScreen ? "Large Screen" : "Small Screen"))
          );
        },
      ),
    );
  }

  List<Widget> _contentWidgets(String text) {
    return [
      const SizedBox(width: 16, height: 106),
      Expanded(
        child: Text(
          text,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    ];
  }
}
