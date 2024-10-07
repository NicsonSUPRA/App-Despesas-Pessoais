import 'package:flutter/material.dart';
import 'package:lista_tarefas/mainPage.dart';

void main() {
  runApp(new Expenses());
}

class Expenses extends StatelessWidget {
  const Expenses({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
