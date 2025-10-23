import 'package:flutter/material.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Todo App',
      home: TextInputWidget(),
    );
  }
}

class TextInputWidget extends StatefulWidget {
  const TextInputWidget({super.key});

  @override
  State createState() => TextInputWidgetState();
}

class TextInputWidgetState extends State {
  final _controller = TextEditingController();
  List todoList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(165, 190, 215, 1.0),
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: ListView.builder(
          itemCount: todoList.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == todoList.length) {
              return createTextArea();
            } else {
              var title = todoList[index];
              return createTodoCard(title);
            }
          }),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget createTodoCard(String title) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ListTile(
            title: Text(title),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  //完了したときの処理
                },
                child: const Text('完了'),
              ),
              const SizedBox(
                width: 10.0,
              ),
              ElevatedButton(
                onPressed: () {
                  //削除したときの処理
                },
                child: const Text('削除'),
              ),
              const SizedBox(
                width: 10.0,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget createTextArea() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: '入力してください'),
              onChanged: (String value) {
                print(value);
              },
              onSubmitted: (String value) {
                setState(() {
                  if (value.isEmpty == false) {
                    todoList.add(value);
                    _controller.clear();
                  }
                });
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('カードを追加する'),
            ),
          )
        ],
      ),
    );
  }
}
