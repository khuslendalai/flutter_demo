import 'package:flutter/material.dart';

class WidgetsLayoutDemo extends StatelessWidget {
  const WidgetsLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets and Layout'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Text('Hello'),
              const Text('World'),
              const Text('and MIU'),

              const SizedBox(height: 8),

              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.travel_explore),
              ),

              IconButton(
                onPressed: () {
                  print('hello');
                },
                icon: const Icon(Icons.waving_hand),
              ),

              ElevatedButton(
                onPressed: () {
                  print('Elevated button was clicked!');
                },
                child: const Text('Click me'),
              ),

              const SizedBox(height: 16),

              OutlinedButton(
                onPressed: () {
                  print('Outlined button was clicked!');
                },
                child: const Text('Click me'),
              ),

              const SizedBox(height: 16),

              TextButton(
                onPressed: () {
                  print('Text button was clicked!');
                },
                child: const Text(
                  'Click me',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
