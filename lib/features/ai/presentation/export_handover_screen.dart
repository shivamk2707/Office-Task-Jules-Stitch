import "package:go_router/go_router.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter/material.dart';

class ExportHandoverScreen extends StatelessWidget {
  const ExportHandoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Export & Handover')),
      body: const Center(child: Text('Export & Handover Screen')),
    );
  }
}
