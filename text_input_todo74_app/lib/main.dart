import 'package:flutter/material.dart';
import 'package:text_input_todo74_app/create_page.dart';
import 'package:text_input_todo74_app/todo_card.dart';
import 'package:text_input_todo74_app/app_route.dart';
import 'package:text_input_todo74_app/task_store.dart';
import 'package:text_input_todo74_app/done_card.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task App',
      routes: {
        AppRoute.todoPage: (context) => const TaskPage(),
        AppRoute.createPage: (context) => const CreatePage(),
      },
      home: const TaskPage(),
    );
  }
}

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  // フィールド変数
  int _selectedIndex = 0;
  List<bool> pageWidgets = [false, true];

  @override
  Widget build(BuildContext context) {
    // ローカル変数
    var isDone = pageWidgets[_selectedIndex];
    // TaskStoreのtaskListからdoneの値がisDoneと等しいものだけを抽出してリスト化し、todoListに代入
    var todoList = TaskStore().taskList
        .where((task) => task.done == isDone)
        .toList();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(165, 190, 215, 1.0),
      appBar: AppBar(title: Text(isDone ? "Done List" : "Task List")),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          // ローカル変数
          var title = todoList[index].title;
          var id = todoList[index].index;
          // 取得した文章とindexを基にCardを作成する
          // TodoCardの組み立て
          var todoCard = TodoCard(
            title: title,
            onPressedComplete: () => _complete(id),
            onPressedDelete: () => _delete(id),
          );
          // DoneCardの組み立て
          var doneCard = DoneCard(
            title: title,
            onPressedDelete: () => _delete(id),
          );
          // isDoneフラグの値に応じてtodoCardかdoneCardをリターンして表示する
          return isDone ? doneCard : todoCard;
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // FABを押したときの処理
          Navigator.of(context).pushNamed(AppRoute.createPage);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          // 1個目の要素
          BottomNavigationBarItem(icon: Icon(Icons.folder_open), label: 'task'),
          // 2個目の要素
          BottomNavigationBarItem(icon: Icon(Icons.done), label: 'done'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orangeAccent,
        onTap: (int index) {
          // setStateで画面を再描画
          setState(
            // 再描画のサインやりたい処理
            () {
              // Tapしたindexを新しいindexとして代入
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }

  // 削除の処理の内部メソッド
  void _delete(int index) {
    // setStateで画面の再描画
    setState(() {
      // 画面の再描画と同時にやりたい処理
      TaskStore().delete(index);
    });
  }

  // 完了の処理の内部メソッド
  void _complete(int index) {
    // setStateで画面の再描画
    setState(() {
      TaskStore().complete(index);
    });
  }
}
