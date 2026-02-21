import 'package:flutter/material.dart';

void main() {
  runApp(const AdaptiveWorkshopApp());
}

class AdaptiveWorkshopApp extends StatelessWidget {
  const AdaptiveWorkshopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const AdaptiveDemoScreen(),
    );
  }
}

class AdaptiveDemoScreen extends StatefulWidget {
  const AdaptiveDemoScreen({super.key});

  @override
  State<AdaptiveDemoScreen> createState() => _AdaptiveDemoScreenState();
}

class _AdaptiveDemoScreenState extends State<AdaptiveDemoScreen> {
  bool isSwitchOn = false;
  bool isChecked = false;
  double sliderValue = 50;
  bool isLoading = false;

  Future<void> _refresh() async {
    setState(() => isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => isLoading = false);
  }

  void _showAdaptiveDialog() {
    showAdaptiveDialog(
      context: context,
      builder:
          (context) => AlertDialog.adaptive(
            title: const Text("Delete Item"),
            content: const Text("Are you sure?"),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
              TextButton(onPressed: () => Navigator.pop(context), child: const Text("Delete")),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adaptive Components Workshop"),
        actions: [IconButton(icon: const Icon(Icons.delete), onPressed: _showAdaptiveDialog)],
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: _refresh,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const Text("1. Adaptive CircularProgressIndicator", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            if (isLoading) const Center(child: CircularProgressIndicator.adaptive()),
            const SizedBox(height: 32),

            const Text("2. Adaptive Switch", style: TextStyle(fontWeight: FontWeight.bold)),
            Switch.adaptive(
              value: isSwitchOn,
              onChanged: (value) {
                setState(() => isSwitchOn = value);
              },
            ),
            const SizedBox(height: 32),

            const Text("3. Adaptive Checkbox", style: TextStyle(fontWeight: FontWeight.bold)),
            Checkbox.adaptive(
              value: isChecked,
              onChanged: (value) {
                setState(() => isChecked = value ?? false);
              },
            ),
            const SizedBox(height: 32),

            const Text("4. Adaptive Slider", style: TextStyle(fontWeight: FontWeight.bold)),
            //TODO
            const SizedBox(height: 32),

            const Text("5. Adaptive Button", style: TextStyle(fontWeight: FontWeight.bold)),
            TextButton(onPressed: () {}, child: const Text("Text Button")),
            const SizedBox(height: 32),

            const Text("Pull down to test RefreshIndicator.adaptive()", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 600), // for scrolling
          ],
        ),
      ),
    );
  }
}
