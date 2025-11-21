import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Navigator")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Third Page", style: TextStyle(fontSize: 40.0)),
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/first');
              }, // タップされた時の処理
              child: const Text("Go to First Page"),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/second');
              }, // タップされた時の処理
              child: const Text("Go to SecondPage Page"),
            ),
          ],
        ),
      ),
    );
  }
}
