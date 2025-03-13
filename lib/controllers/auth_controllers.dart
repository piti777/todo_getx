import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:todo_getx/views/home_view.dart';

class AuthController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> register(String email, String password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar("สำเร็จ", "สมัครสมาชิกเสร็จสิ้น");
    } catch (e) {
      Get.snackbar("ล้มเหลว", e.toString());
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar("สำเร็จ", "เข้าสู่ระบบเสร็จสิ้น");
      Get.off(HomeView());
    } catch (e) {
      Get.snackbar("ล้มเหลว", e.toString());
    }
  }
}
