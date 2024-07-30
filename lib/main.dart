import 'package:dyshez_app/config/routes/routes.dart';
import 'package:dyshez_app/presentation/bindings/global_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  runApp(const DyshezApp());
}

class DyshezApp extends StatelessWidget {
  const DyshezApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dyshez',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        cardTheme: CardTheme(
          color: const Color(0xFFFFFFFF),
          surfaceTintColor: const Color(0xFFFFFFFF),
          shadowColor: const Color(0xFF000000),
          margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.w600,
            color: Color(0xFF262338),
            height: 0.6875,
          ),
          titleMedium: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF262338),
            height: 0.6875,
          ),
          titleSmall: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF797979),
            height: 0.6875,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
            color: Color(0xFF747474),
            fontSize: 16.0,
          ),
        ),
      ),
      initialRoute: '/',
      initialBinding: GlobalBinding(),
      getPages: DyshezRoute.routes,
    );
  }
}
