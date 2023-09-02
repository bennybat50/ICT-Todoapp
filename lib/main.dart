import 'package:flutter/material.dart';
import 'package:todoapp/splash_screen.dart';

import 'database_repo/database_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDb();
  runApp(const MyApp());
}

void initDb() async {
  await DatabaseRepository.instance.todoDatabase;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My ToDo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const SplashScreen(),
    );
  }
}
