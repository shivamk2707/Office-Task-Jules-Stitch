import "package:go_router/go_router.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
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
