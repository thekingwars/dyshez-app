import 'package:dyshez_app/domain/datasources/auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthDatasourceImpl extends AuthDataSource {
  final Supabase supabase = Supabase.instance;

  @override
  Future<User> login(String email, String password) async {
    final AuthResponse res = await supabase.client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    return res.user!;
  }

  @override
  Future<void> logout() async {
    await supabase.client.auth.signOut();
  }

  @override
  Stream<AuthState> userStateChange() {
    return supabase.client.auth.onAuthStateChange;
  }
}
