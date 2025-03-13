import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/auth_controllers.dart';
import 'package:todo_getx/views/register_views.dart';
import 'package:todo_getx/widgets/app_text_field.dart';

class LoginView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เข้าสู่ระบบ'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            AppTextField(label: 'อีเมล', controller: emailController),
            SizedBox(
              height: 10,
            ),
            AppTextField(
              label: 'รหัสผ่าน',
              controller: passwordController,
              hideText: true,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  if (!GetUtils.isEmail(emailController.text)) {
                    Get.snackbar(
                      "Error",
                      "กรุณากรอกรหัสผ่านให้ครบ อย่างน้อย 6 ตัว",
                      backgroundColor: const Color.fromARGB(255, 216, 4, 4),
                      colorText: Colors.amber,
                    );
                    return;
                  }
                  if (passwordController.text.length < 6) {
                    Get.snackbar(
                      "Error",
                      "กรอก Password ดิ๊",
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.black,
                    );
                    return;
                  }

                  authController.login(
                    emailController.text,
                    passwordController.text,
                  );
                },
                child: const Text('เข้าสู่ระบบ')),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.to(RegisterView());
              },
              child: Text("สมัครสมาชิก"),
            )
          ],
        ),
      ),
    );
  }
}
