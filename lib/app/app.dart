import 'package:flutter/material.dart';

class MYApp extends StatefulWidget {
// named constructor to make the constructor private
  const MYApp._init();
// private instance from the named constructor

  static const _instance = MYApp._init();

  factory MYApp() => _instance;

  @override
  State<MYApp> createState() => _MYAppState();
}

class _MYAppState extends State<MYApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("hello World!!"),
        ),
      ),
    );
  }
}
