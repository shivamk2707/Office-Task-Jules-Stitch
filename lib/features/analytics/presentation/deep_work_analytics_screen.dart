import "package:go_router/go_router.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter/material.dart';

class DeepWorkAnalyticsScreen extends StatelessWidget {
  const DeepWorkAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Deep Work Analytics')),
      body: const Center(child: Text('Deep Work Analytics Screen')),
    );
  }
}
