import 'package:dyshez_app/domain/repositories/auth.dart';
import 'package:dyshez_app/infrastructure/datasources/auth.dart';
import 'package:dyshez_app/infrastructure/repositories/auth.dart';
import 'package:dyshez_app/presentation/controllers/auth.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class GlobalBinding extends Bindings {
  final AuthRepository authRepository = AuthRepositoryImpl(
    authDatasource: AuthDatasourceImpl(),
  );

  @override
  void dependencies() {
    Get.put(
      AuthController(authRepository: authRepository),
    );
  }
}
