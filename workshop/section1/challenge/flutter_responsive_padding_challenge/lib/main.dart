import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.sizeOf(context).width;
    // final isLargeScreen = screenWidth >= 600;
    return MaterialApp(
      home: Scaffold(
        body: SecondChallenge(),
        appBar: AppBar(title: Text("Responsive Navbar Challenge")),
      ),
    );
  }
}

class SecondChallenge extends StatefulWidget {
  const SecondChallenge({super.key});
  @override
  State<SecondChallenge> createState() => _SecondChallengeState();
}

class _SecondChallengeState extends State<SecondChallenge> {
  static const List<Widget> _pages = <Widget>[
    Center(child: Text("Home")),
    Center(child: Text("Setting")),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isLargeScreen = screenWidth >= 600;
    return Scaffold(
      body: isLargeScreen ? _leftNav() : _bottomNav(),
    );
  }

  Scaffold _bottomNav() {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Scaffold _leftNav() {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            // Shows icons and labels
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                label: Text('Setting'),
              ),
            ],
            // Optional customizations
            //backgroundColor: Colors.grey[200],
            //leading: const Icon(Icons.menu), // Widget above the destinations
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // Main content area
          Expanded(child: _pages[_selectedIndex]),
        ],
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
            child: Row(
              children: _contentWidgets(
                isLargeScreen ? "Large Screen" : "Small Screen",
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> _contentWidgets(String text) {
    return [
      const SizedBox(width: 16, height: 106),
      Expanded(
        child: Text(text, style: TextStyle(fontSize: 18, color: Colors.white)),
      ),
    ];
  }
}
