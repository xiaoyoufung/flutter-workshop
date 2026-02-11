import 'package:flutter/material.dart';

void main() {
  runApp(const CatalogApp());
}

class CatalogApp extends StatelessWidget {
  const CatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const CatalogScreen(),
    );
  }
}

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  // Mock image URLs
  static const images = [
    'https://images.unsplash.com/photo-1521412644187-c49fa049e84d',
    'https://images.unsplash.com/photo-1509027572446-af8401acfdc3',
    'https://images.unsplash.com/photo-1546519638-68e109498ffc',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog'),
        actions: const [Icon(Icons.filter_list), SizedBox(width: 12), Icon(Icons.help_outline), SizedBox(width: 12)],
      ),
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return AspectRatio(
            aspectRatio: 4 / 3,
            child: Image.network(
              images[index],
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt_outlined), label: 'Quick capture'),
          BottomNavigationBarItem(icon: Icon(Icons.image_outlined), label: 'All images'),
          BottomNavigationBarItem(icon: Icon(Icons.cloud_upload_outlined), label: 'Bulk upload'),
        ],
      ),
    );
  }
}
