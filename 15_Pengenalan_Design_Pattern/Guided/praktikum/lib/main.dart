import 'package:flutter/material.dart';
import 'package:praktikum/mvc/view/mvcView.dart';
// import 'package:praktikum/mvvm/view/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const MvcView());
    // return MaterialApp(home: const MvvmView());
  }
}
