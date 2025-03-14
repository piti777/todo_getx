import 'package:get/get.dart';
import 'package:todo_getx/controllers/auth_controllers.dart';
import 'package:todo_getx/services/storage_services.dart';

import '../models/todo_model.dart';

class TodoController extends GetxController {
  var todoList = <TodoModel>[].obs;
  StorageService storageService = StorageService();
  AuthController authController = Get.put(AuthController());

  @override
  void onInit() {
    super.onInit();
    fetchTodos();
  }

  void fetchTodos() async {
    var todos = await storageService.read(
      'todoList',
      authController.user.value?.uid ?? '',
    );
    if (todos != null) {
      todoList.value = List<TodoModel>.from(
        todos.map((x) => TodoModel.fromJson(x)),
      );
    }
  }

  Future<void> addTodo(String title, String subtitle) async {
    TodoModel todo = TodoModel(
      title,
      subtitle,
      false,
      uid: authController.user.value?.uid,
    );

    String docId = await storageService.write('todoList', todo.toJson());
    todo.docId = docId;
    todoList.add(todo);
  }

  Future<void> updataTodo(TodoModel todo) async {
    todoList.firstWhere((to) => todo.docId == todo.docId).title;
    todoList.firstWhere((to) => todo.docId == todo.docId).subtitle;
    todoList.refresh();
    await storageService.update('todoList', todo.docId ?? '', todo.toJson());
  }

  void toggleTodo(int index) {
    todoList[index].isDone = !todoList[index].isDone;
    todoList.refresh();
  }

  void deleteTodo(String docId) {
    todoList.removeWhere((todo) => todo.docId == docId);
    storageService.delete('todoList', docId);
  }

  void clearTodo() {
    todoList.clear();
  }
}
