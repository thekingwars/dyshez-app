import 'package:dyshez_app/config/mixins/loader.dart';
import 'package:dyshez_app/presentation/controllers/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();
  final AuthController _authController = Get.find<AuthController>();

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get usernameController => _username;
  TextEditingController get passwordController => _password;

  @override
  void onInit() {
    _username.text = '';
    _password.text = '';

    super.onInit();
  }

  @override
  void onClose() {
    _username.dispose();
    _password.dispose();
    _formKey.currentState?.reset();
    super.onClose();
  }

  void login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    showLoader();

    try {
      final user = await _authController.login(_username.text, _password.text);

      _authController.user.value = user;

      Get.back();

      Get.showSnackbar(
        GetSnackBar(
          title: 'Bienvenido: ${user.email}',
          message: 'Iniciaste sesión correctamente',
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
        ),
      );
    } catch (e) {
      Get.back();

      Get.showSnackbar(
        const GetSnackBar(
          title: 'Error',
          message: 'Usuario o contraseña incorrectos',
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'El username es requerido';
    }

    if (!GetUtils.isEmail(value)) {
      return 'El username debe ser un correo electrónico';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'La contraseña es requerida';
    }

    if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }

    return null;
  }
}
