import 'package:dyshez_app/presentation/controllers/login.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => LoginController());
  }
}
