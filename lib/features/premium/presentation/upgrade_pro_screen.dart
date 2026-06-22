import 'package:flutter/material.dart';

class UpgradeProScreen extends StatelessWidget {
  const UpgradeProScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upgrade to Pro')),
      body: const Center(child: Text('Upgrade to Pro Screen')),
    );
  }
}
