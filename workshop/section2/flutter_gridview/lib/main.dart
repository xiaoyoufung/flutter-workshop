import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List ↔ Grid Workshop',
      theme: ThemeData(useMaterial3: true),
      home: const SwitchLayoutPage(),
    );
  }
}

class SwitchLayoutPage extends StatefulWidget {
  const SwitchLayoutPage({super.key});

  @override
  State<SwitchLayoutPage> createState() => _SwitchLayoutPageState();
}

class _SwitchLayoutPageState extends State<SwitchLayoutPage> {
  bool isGrid = true;

  final items = List.generate(20, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List ↔ Grid View'),
        actions: [
          IconButton(
            icon: Icon(isGrid ? Icons.list : Icons.grid_view),
            onPressed: () {
              setState(() {
                isGrid = !isGrid;
              });
            },
          ),
        ],
      ),
      body: Padding(padding: const EdgeInsets.all(12), child: isGrid ? _buildGridView() : _buildListView()),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(child: ListTile(leading: const Icon(Icons.label), title: Text(items[index])));
      },
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //   // justify the fix of the column
      //   crossAxisCount: 2,
      //   // space between rows
      //   mainAxisSpacing: 12,
      //   // space between columns
      //   crossAxisSpacing: 12,
      //   // (width / height)
      //   childAspectRatio: 1.2,
      // ),
      // the max width of the item
      // Ipad gridview > listview
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(elevation: 2, child: Center(child: Text(items[index], style: const TextStyle(fontSize: 16))));
      },
    );
  }
}
