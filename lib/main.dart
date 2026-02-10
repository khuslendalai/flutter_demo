import 'package:flutter/material.dart';

void main () {
  runApp(FlutterDemoApp());
}

class FlutterDemoApp extends StatelessWidget {
  const FlutterDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Hello World')),
      body: Center(child: Text('Hello MIU!')),
    );
  }
}