import 'dart:async';

import 'package:dyshez_app/domain/repositories/auth.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository;
  late StreamSubscription<AuthState> _subscription;

  AuthController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  final Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() {
    user.bindStream(
      _authRepository.userStateChange().map((event) {
        if (event.session != null) {
          Get.offNamed('/orders');
        } else {
          Get.offNamed('/');
        }

        return event.session?.user;
      }),
    );
    super.onInit();
  }

  @override
  void onClose() {
    _subscription.cancel();
    user.close();
    super.onClose();
  }

  Future<User> login(String email, String password) async {
    try {
      return await _authRepository.login(email, password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await _authRepository.logout();
    } catch (e) {
      rethrow;
    }
  }
}
