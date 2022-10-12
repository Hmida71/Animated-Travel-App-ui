import 'package:flutter/material.dart';

class Another extends StatefulWidget {
  const Another({Key? key}) : super(key: key);

  @override
  State<Another> createState() => _AnotherState();
}

class _AnotherState extends State<Another> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(child: Text("Another Page Yoo !")),
      ),
    );
  }
}
