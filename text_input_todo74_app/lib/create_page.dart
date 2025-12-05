import 'package:flutter/material.dart';
import 'package:text_input_todo74_app/app_route.dart';
import 'package:text_input_todo74_app/task_store.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  // テキスト入力欄のコントローラー
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(165, 190, 215, 1.0),
      appBar: AppBar(title: const Text('新規作成')),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          // リストビューのアイテム構築の処理
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
                    onSubmitted: _submitTodo,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 5.0,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      _submitTodo(_controller.text);
                    },
                    child: const Text('カードを追加する'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _submitTodo(String title) {
    // setStateで画面を更新する
    setState(() {
      // 画面描画の際にやっておきたい処理
      TaskStore().submitTodo(title);
      // 画面遷移を実行
      Navigator.popAndPushNamed(context, AppRoute.todoPage);
    });
  }
}
