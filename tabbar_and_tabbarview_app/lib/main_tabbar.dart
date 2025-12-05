import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TabBar and TabBarView App',
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State createState() => _HomepageState();
}

class _HomePageState extends State {
  final List tabs = [
    const Tab(text: 'HOME', icon: Icon(Icons.home)),
    const Tab(text: 'MESSAGES', icon: Icon(Icons.message)),
    const Tab(text: 'SETTINGS', icon: Icon(Icons.settings)),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Sample App'),
          bottom: TabBar(
            tabs: tabs,
          ),
        ),
        body: const TabBarView(
          children: [
            TabPage(title: 'HOME', textColor: Colors.black),
            TabPage(title: 'MESSAGES', textColor: Colors.red),
            TabPage(title: 'SETTINGS', textColor: Colors.green),
          ],
        ),
      ),
    );
  }

  class TabPage extends StatelessWidget {
  final String title;
  final Color textColor;

  const TabPage({super.key, required this.title, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text( 
            title,
            style: TextStyle(fontSize: 64.0, color: textColor),
          ),
        ],
      )
    );
  }
}   
}