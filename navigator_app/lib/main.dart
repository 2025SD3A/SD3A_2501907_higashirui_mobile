import 'package:flutter/material.dart';
import 'package:navigator_app/second_page.dart';
import 'package:navigator_app/third_page.dart';
import 'package:navigator_app/fourth_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FirstPage(),
      routes: <String, WidgetBuilder>{
        "/first": (BuildContext context) => FirstPage(),
        "/second": (BuildContext context) => SecondPage(),
        "/third": (BuildContext context) => ThirdPage(),
        "/fourth": (BuildContext context) => FourthPage(),
      },
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigator Sample App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('First Page', style: TextStyle(fontSize: 40.0)),
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return const SecondPage();
                //     },
                //   ),
                // );
                Navigator.of(context).pushNamed("/second");
              },
              child: const Text('Go to Second Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/third");
              },
              child: const Text('Go to Third Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).pushNamed("/fourth", arguments: "Hello world");
              },
              child: const Text("Go to Fourth Page"),
            ),
          ],
        ),
      ),
    );
  }
}
