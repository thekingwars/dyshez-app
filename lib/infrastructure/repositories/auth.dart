import 'package:dyshez_app/domain/datasources/auth.dart';
import 'package:dyshez_app/domain/repositories/auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource authDatasource;

  AuthRepositoryImpl({required this.authDatasource});

  @override
  Future<User> login(String email, String password) async {
    try {
      return await authDatasource.login(email, password);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await authDatasource.logout();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<AuthState> userStateChange() {
    return authDatasource.userStateChange();
  }
}
