import 'package:flutter/material.dart';

class DoneCard extends StatelessWidget {
  // プロパティ変数
  final String title;
  final VoidCallback onPressedDelete;

  // コンストラクタ
  const DoneCard({
    super.key,
    required this.title,
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
