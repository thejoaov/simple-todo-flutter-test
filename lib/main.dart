import 'package:flutter/material.dart';
import 'login_page.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const LoginPage(),
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.deepPurple,
        ));
  }
}
