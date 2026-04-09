import 'package:flutter/material.dart';

class NetworkingDemo extends StatefulWidget {
  const NetworkingDemo({super.key});

  @override
  State<NetworkingDemo> createState() => _NetworkingDemoState();
}

class _NetworkingDemoState extends State<NetworkingDemo> {
  final networkingManager = NetworkingManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
        ElevatedButton(onPressed: () {}, child: const Text('GET'),),
        const SizedBox(height: 20),
        ElevatedButton(onPressed: () {}, child: const Text('POST'),),
      ],
    ))
  );
  }
}

class NetworkingManager {
  Future<void> get() async {}
  Future<void> post() async {}
}