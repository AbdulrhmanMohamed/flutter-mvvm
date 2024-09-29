import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello World"),
      ),
      body: Container(
        color: Colors.red,
        child: const Text(
          "separating screen####r",
        ),
      ),
    );
  }
}
