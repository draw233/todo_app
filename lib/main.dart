import 'package:flutter/material.dart';
import 'package:todo_app/pages/my_todo_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'TODO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.yellow,
        // useMaterial3: true,
      ),
      home: MyTodoHomePage(),
    );
  }
}
