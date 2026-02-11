import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MultiActionApp());
}

class MultiActionApp extends StatelessWidget {
  const MultiActionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: MultiActionDemo());
  }
}

class MultiActionDemo extends StatefulWidget {
  const MultiActionDemo({super.key});

  @override
  State<MultiActionDemo> createState() => _MultiActionDemoState();
}

class _MultiActionDemoState extends State<MultiActionDemo> {
  final List<String> items = ['Item A', 'Item B', 'Item C'];
  int? focusedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Multiple Actions on One Widget')),
      body: Shortcuts(
        shortcuts: {
          LogicalKeySet(LogicalKeyboardKey.delete): DeleteItemIntent(),
          LogicalKeySet(LogicalKeyboardKey.keyN): NewItemIntent(),
        },
        child: Actions(
          actions: {
            DeleteItemIntent: CallbackAction<DeleteItemIntent>(
              onInvoke: (intent) {
                if (focusedIndex != null) {
                  setState(() {
                    items.removeAt(focusedIndex!);
                    focusedIndex = null;
                  });
                }
                return null;
              },
            ),
            NewItemIntent: CallbackAction<NewItemIntent>(
              onInvoke: (intent) {
                setState(() {
                  items.add('Item ${items.length + 1}');
                });
                return null;
              },
            ),
          },
          child: FocusTraversalGroup(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return FocusableActionDetector(
                  onShowFocusHighlight: (focused) {
                    if (focused) {
                      setState(() {
                        focusedIndex = index;
                      });
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: focusedIndex == index ? Colors.blue : Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(items[index]),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

/// Intents
class DeleteItemIntent extends Intent {
  const DeleteItemIntent();
}

class NewItemIntent extends Intent {
  const NewItemIntent();
}
