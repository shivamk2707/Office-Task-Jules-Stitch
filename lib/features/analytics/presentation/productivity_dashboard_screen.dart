import 'package:flutter/material.dart';

class ProductivityDashboardScreen extends StatelessWidget {
  const ProductivityDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Productivity Dashboard')),
      body: const Center(child: Text('Productivity Dashboard Screen')),
    );
  }
}
