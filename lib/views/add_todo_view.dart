import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/todo_controller.dart';

// ignore: must_be_immutable
class AddTodoView extends StatelessWidget {
  AddTodoView({super.key});

  TodoController todoController = Get.put(TodoController());
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("เพิ่มรายการ", style: TextStyle(fontSize: 20)),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("ชื่อรายการ", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "ระบุชื่อรายการ",
              ),
            ),
            SizedBox(height: 20),
            Text("รายละเอียด", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            TextField(
              controller: subtitleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "ระบุรายละเอียด",
              ),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isEmpty) return;
                todoController.addTodo(
                  titleController.text,
                  subtitleController.text,
                );
                Get.back();
                Get.snackbar(
                  "แจ้งเตือน",
                  "บันทึกสำเร็จ",
                  backgroundColor: Colors.green,
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              child: Text("บันทึก", style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
