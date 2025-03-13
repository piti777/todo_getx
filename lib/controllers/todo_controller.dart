import 'package:get/get.dart';
import 'package:todo_getx/services/storage_services.dart';

import '../models/todo_model.dart';

class TodoController extends GetxController {
  var todoList = <TodoModel>[].obs;
  StorageService storageService = StorageService();

  @override
  void onInit() {
    super.onInit();
    fetchTodos();
  }

  void fetchTodos() {
    var todos = storageService.read('todolist');
    if (todos != null) {
      todoList.value = List<TodoModel>.from(
        todos.map((x) => TodoModel.fromJson(x)),
      );
    }
  }

  void addTodo(String title, String subtitle) {
    todoList.add(TodoModel(title, subtitle, false));
    storageService.write("todolist", todoList.toJson());
  }

  void toggleTodo(int index) {
    todoList[index].isDone = !todoList[index].isDone;
    todoList.refresh();
  }

  void deleteTodo(int index) {
    todoList.removeAt(index);
  }
}
