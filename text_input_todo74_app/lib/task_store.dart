import 'package:text_input_todo74_app/task.dart';

class TaskStore {
  static final TaskStore _cache = TaskStore.internal();
  TaskStore.internal();

  factory TaskStore() {
    return _cache;
  }

  // タスク一覧を格納する配列
  List<Task> taskList = [];

  // タスクを追加する関数
  void submitTodo(String title) {
    if (title.isEmpty == false) {
      // titleが空文字でない場合、新規タスクを生成して追加
      var task = Task(index: taskList.length, title: title, done: false);
      taskList.add(task);
    }
  }

  // インデックスを指定してタスクを削除する関数
  void delete(int index) {
    taskList.removeWhere((element) => element.index == index);
  }

  // インデックスを指定してタスクを完了する関数
  void complete(int index) {
    taskList.firstWhere((element) => element.index == index).done = true;
  }
}
