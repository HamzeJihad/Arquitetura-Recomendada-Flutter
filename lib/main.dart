import 'package:arquitetura_recomendada/ui/todo/viewmodels/todo_viewmodel.dart';
import 'package:arquitetura_recomendada/ui/todo/widgets/todo_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  TodoScreen(todoViewmodel: TodoViewmodel()),
    );
  }
}
