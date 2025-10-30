import 'package:flutter/material.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sample App",
      home: Scaffold(
          appBar: AppBar(title: const Text('Sample Custom Widget App')),
          body: const Center(
              child: Column(children: [
            UserNameWidget(name: 'Tanaka'),
            UserNameWidget(name: 'Yamada', age: 22)
          ]))),
    );
  }
}

class UserNameWidget extends StatelessWidget {
  final String name;
  final int? age;

  const UserNameWidget({super.key, required this.name, this.age});

  @override
  Widget build(BuildContext context) {
    var userAge = age ?? 0;
    return Column(
      children: [Text(name), Text('$userAge')],
    );
  }
}
