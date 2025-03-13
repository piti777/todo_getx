import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/auth_controllers.dart';
import 'package:todo_getx/widgets/app_text_field.dart';

class RegisterView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('สมัครสมาชิก'),
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
            AppTextField(label: 'รหัสผ่าน', controller: passwordController),
            SizedBox(
              height: 10,
            ),
            AppTextField(
              label: 'ยืนยันรหัสผ่าน',
              controller: confirmPasswordController,
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
                  if (passwordController.text !=
                      confirmPasswordController.text) {
                    Get.snackbar("Error", "Password ไม่ตรงกันจ้าสาว",
                        backgroundColor: Colors.red, colorText: Colors.black);
                    return;
                  }
                  authController.register(
                    emailController.text,
                    passwordController.text,
                  );
                },
                child: const Text('สมัครสมาชิก')),
          ],
        ),
      ),
    );
  }
}
