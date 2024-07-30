import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthDataSource {
  Future<User> login(String email, String password);
  Future<void> logout();
  Stream<AuthState> userStateChange();
}
