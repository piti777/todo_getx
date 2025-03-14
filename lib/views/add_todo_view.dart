import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/todo_controller.dart';
import 'package:todo_getx/models/todo_model.dart';

// ignore: must_be_immutable
class AddTodoView extends StatefulWidget {
  AddTodoView({super.key, this.todo});
  TodoModel? todo;

  @override
  State<AddTodoView> createState() => _AddTodoViewState();
}

class _AddTodoViewState extends State<AddTodoView> {
  TodoController todoController = Get.put(TodoController());

  TextEditingController titleController = TextEditingController();

  TextEditingController subtitleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.todo != null) {
      titleController.text = widget.todo!.title;
      subtitleController.text = widget.todo!.subtitle;
    }
  }

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
            Text(widget.todo != null ? "แก้ไข" : "เพิ่ม"),
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
                if (widget.todo != null) {
                  widget.todo!.title = titleController.text;
                  widget.todo!.title = subtitleController.text;
                  todoController.updataTodo(widget.todo!);
                } else {
                  todoController.addTodo(
                      titleController.text, subtitleController.text);
                }
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
