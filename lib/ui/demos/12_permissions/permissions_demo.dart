import 'package:flutter/material.dart';

class PermissionsDemo extends StatefulWidget {
  const PermissionsDemo({super.key});

  @override
  State<PermissionsDemo> createState() => _PermissionsDemoState();
}

class _PermissionsDemoState extends State<PermissionsDemo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Permissions Demo"),
        ElevatedButton(
          onPressed: () {
            // Handle button press
          },
          child: const Text("Find My Location"),
        ),
      ],);
  }
}