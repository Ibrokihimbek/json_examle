import 'package:flutter/material.dart';
import 'package:json_example/screens/chat_gpt/chat_gpt_page.dart';
import 'package:json_example/screens/home/home_page.dart';
import 'package:json_example/screens/password/password_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatGptPage(),
    );
  }
}
