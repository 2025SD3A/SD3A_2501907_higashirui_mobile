import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  // プロパティを宣言する
  final String title;
  // final int index;
  final VoidCallback onPressedComplete; // _completeのためのプロパティ
  final VoidCallback onPressedDelete; // _deleteのためのプロパティ

  // コンストラクタを定義する。必須プロパティにするためrequiredを記述
  const TodoCard({
    super.key,
    required this.title,
    // required this.index,
    required this.onPressedComplete,
    required this.onPressedDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ListTile(title: Text(title)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: onPressedComplete,
                child: const Text('完了'),
              ),
              const SizedBox(width: 10.0),
              ElevatedButton(
                onPressed: onPressedDelete,
                child: const Text('削除'),
              ),
              const SizedBox(width: 10.0),
            ],
          ),
        ],
      ),
    );
  }
}
