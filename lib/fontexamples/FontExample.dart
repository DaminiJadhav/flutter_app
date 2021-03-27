import 'dart:ui';

import 'package:flutter/material.dart';

class FontExample extends StatefulWidget {
  @override
  _FontExampleState createState() => _FontExampleState();
}

class _FontExampleState extends State<FontExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter"),
      ),
      body: Center(
        child: Text("Hello",style: TextStyle(fontFamily: 'Charlotte'),),
      ),
    );
  }
}
