import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Navigator")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Second Page", style: TextStyle(fontSize: 40.0)),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              }, // タップされた時の処理
              child: const Text("Back to Previous Page"),
            ),
          ],
        ),
      ),
    );
  }
}
