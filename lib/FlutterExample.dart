import 'package:flutter/material.dart';

class FlutterExample extends StatefulWidget {
  @override
  _FlutterExampleState createState() => _FlutterExampleState();
}

class _FlutterExampleState extends State<FlutterExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter"),
      ),
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}
