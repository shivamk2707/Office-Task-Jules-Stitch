import "package:go_router/go_router.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter/material.dart';

class AdvancedFiltersScreen extends StatelessWidget {
  const AdvancedFiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Advanced Filters')),
      body: const Center(child: Text('Advanced Filters Screen')),
    );
  }
}
