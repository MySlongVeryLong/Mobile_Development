import 'package:flutter/material.dart';

class GreenScreen extends StatelessWidget {
  const GreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(child: Text("Green Screen")),
    );
  }
}

class RedScreen extends StatelessWidget {
  const RedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(child: Text("Red Screen")),
    );
  }
}

class BlueScreen extends StatelessWidget {
  const BlueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(child: Text("Blue Screen")),
    );
  }
}

enum AppTabs { red, green, blue }

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AppTabs _currentTab = AppTabs.red;

  Widget get content {
    switch (_currentTab) {
      case AppTabs.red:
        return RedScreen();
      case AppTabs.green:
        return GreenScreen();
      case AppTabs.blue:
        return BlueScreen();
    }
  }

  void _selectTab(AppTabs tab) {
    setState(() {
      _currentTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tabs navigation")),
      body: content,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.home ,color: Colors.red),
              isSelected: _currentTab == AppTabs.red,
              onPressed: () => _selectTab(AppTabs.red),
            ),

            IconButton(
              icon: const Icon(Icons.home, color: Colors.blue),
              isSelected: _currentTab == AppTabs.blue,
              onPressed: () => _selectTab(AppTabs.blue),
            ),

            IconButton(
              icon: const Icon(Icons.home, color: Colors.green),
              isSelected: _currentTab == AppTabs.green,
              onPressed: () => _selectTab(AppTabs.green),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: App()));
}
