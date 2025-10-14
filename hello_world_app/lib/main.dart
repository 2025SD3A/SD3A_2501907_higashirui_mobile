import 'package:flutter/material.dart';

void main() {
  runApp(const MainPage());
}

final List<Image> imageList = <Image>[
  Image.asset(
    'assets/cat_image.png',
    width: 300.0,
  ),
  Image.asset(
    'assets/dog_image.png',
    width: 200.0,
  ),
];

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sample App",
      home: Scaffold(
        appBar: AppBar(title: const Text('Sample Custom Widget App')),
        body: Center(
          child: ListView.builder(
            padding:
                const EdgeInsets.symmetric(horizontal: 50.0, vertical: 100.0),
            scrollDirection: Axis.vertical,
            itemCount: imageList.length,
            itemBuilder: (context, index) {
              final imageWidget = imageList[index];
              return Center(
                child: Container(
                  width: imageWidget.width,
                  margin: const EdgeInsets.only(bottom: 20),
                  child: imageWidget,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
