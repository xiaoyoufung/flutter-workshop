import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const FocusTraversalApp());
}

class FocusTraversalApp extends StatelessWidget {
  const FocusTraversalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: const FocusDemoScreen());
  }
}

class FocusDemoScreen extends StatelessWidget {
  const FocusDemoScreen({super.key});

  Widget buildTextFields() {
    return Column(
      children: [
        TextField(decoration: InputDecoration(labelText: 'First Name')),
        const SizedBox(height: 16),
        TextField(decoration: InputDecoration(labelText: 'Last Name')),
        const SizedBox(height: 16),
        TextField(decoration: InputDecoration(labelText: 'Email')),
        const SizedBox(height: 16),
        TextField(decoration: InputDecoration(labelText: 'Password')),
        const SizedBox(height: 16),
        ElevatedButton(onPressed: null, child: const Text('Login')),
      ],
    );
  }

  Widget buildOrderTextFields() {
    return FocusTraversalGroup(
      policy: OrderedTraversalPolicy(),
      child: Column(
        children: [
          FocusTraversalOrder(
            order: const NumericFocusOrder(2),
            child: const TextField(decoration: InputDecoration(labelText: 'First Name')),
          ),
          const SizedBox(height: 16),

          FocusTraversalOrder(
            order: const NumericFocusOrder(3),
            child: const TextField(decoration: InputDecoration(labelText: 'Last Name')),
          ),
          const SizedBox(height: 24),

          FocusTraversalOrder(
            order: const NumericFocusOrder(1),
            child: const TextField(decoration: InputDecoration(labelText: 'Email')),
          ),
          const SizedBox(height: 16),

          FocusTraversalOrder(
            order: const NumericFocusOrder(4),
            child: const TextField(decoration: InputDecoration(labelText: 'Password')),
          ),
          const SizedBox(height: 16),

          FocusTraversalOrder(
            order: const NumericFocusOrder(5),
            child: ElevatedButton(onPressed: () {}, child: const Text('Login')),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tab Traversal & Focus')),
      // body: Padding(padding: const EdgeInsets.all(24), child: buildTextFields()),
      body: Padding(padding: const EdgeInsets.all(24), child: buildOrderTextFields()),
    );
  }
}
