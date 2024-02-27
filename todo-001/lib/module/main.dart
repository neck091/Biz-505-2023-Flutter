import 'package:flutter/material.dart';
import 'todo_app.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Todo",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TodoApp(),
    );
  }
}

// class _TodoAppState extends State<TodoApp> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
