import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hello_world/main.dart';
import 'package:hello_world/screens/home.dart';

class AuthHelper {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  // Create new User
  signUp(String email, String pass) async {
    try {
      Get.defaultDialog(
        title: 'Please wait',
        middleText: 'Creating User...',
      );
      final result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      print('test === ${result.user.uid}');
      final User user = result.user;

      if (user != null) {
        Get.back();
        Get.snackbar('Success', 'Account Created Successfully!',
            snackPosition: SnackPosition.BOTTOM);
        Future.delayed(Duration(seconds: 3)).then((value) => Get.back());
      }
    } catch (e) {
      Get.back();
      Get.snackbar('Error', '${e.toString()}',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Login
  login(String email, String pass) async {
    try {
      Get.defaultDialog(
        title: 'Please wait',
        middleText: 'Loging in...',
      );
      final result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      final User user = result.user;

      if (user != null) {
        Get.back();
        Get.offAll(HomeScreen());
      }
    } catch (e) {
      Get.back();
      Get.snackbar('Error', '${e.toString()}',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Signout
  Signout() async {
    await _auth.signOut();
    Get.offAll(MyHomePage());
  }
}
