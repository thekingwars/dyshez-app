import 'package:dyshez_app/presentation/controllers/login.dart';
import 'package:dyshez_app/presentation/shared/dyshez_button.dart';
import 'package:dyshez_app/presentation/shared/dyshez_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final safeAreaPadding = MediaQuery.of(context).padding.top +
        MediaQuery.of(context).padding.bottom;
    final availableHeight = screenHeight - safeAreaPadding;

    final LoginController loginController = Get.put<LoginController>(
      LoginController(),
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: availableHeight,
            child: Form(
              key: loginController.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage('assets/images/logo.png'),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    'Iniciar Sesión',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 20.0),
                  DyshezInput(
                    controller: loginController.usernameController,
                    hintText: 'Username',
                    inputIcon: Icons.alternate_email,
                    validator: loginController.validateUsername,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  DyshezInput(
                    controller: loginController.passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    inputIcon: Icons.lock,
                    keyboardType: TextInputType.visiblePassword,
                    validator: loginController.validatePassword,
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: DyshezButton(
                      onPressed: loginController.login,
                      text: 'Iniciar Sesión',
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.0,
                    ),
                    child: Divider(),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: DyshezButton(
                      text: 'Iniciar Sesión con Google',
                      onPressed: () async {
                        const webClientId =
                            '891104105225-5p65k06037pc395suab05gfeahotp1hm.apps.googleusercontent.com';

                        const iosClientId =
                            '891104105225-d0je93cc8rqdvq1depocbb6fst536erp.apps.googleusercontent.com';

                        final GoogleSignIn googleSignIn = GoogleSignIn(
                          clientId: iosClientId,
                          serverClientId: webClientId,
                        );
                        final googleUser = await googleSignIn.signIn();
                        final googleAuth = await googleUser!.authentication;
                        final accessToken = googleAuth.accessToken;
                        final idToken = googleAuth.idToken;

                        if (accessToken == null) {
                          throw 'No Access Token found.';
                        }
                        if (idToken == null) {
                          throw 'No ID Token found.';
                        }

                        Supabase.instance.client.auth.signInWithIdToken(
                          provider: OAuthProvider.google,
                          idToken: idToken,
                          accessToken: accessToken,
                        );
                      },
                      backgroundColor: Colors.transparent,
                      textColor: Colors.black,
                      borderSide: const BorderSide(
                        color: Color(0xFFE3E3E3),
                        width: 1.6,
                      ),
                      icon: Image.asset('assets/images/google_logo.png'),
                      foregroundColor: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
