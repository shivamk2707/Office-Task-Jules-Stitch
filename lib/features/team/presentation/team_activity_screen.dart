import "package:go_router/go_router.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter/material.dart';

class TeamActivityScreen extends StatelessWidget {
  const TeamActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Team Activity')),
      body: const Center(child: Text('Team Activity Screen')),
    );
  }
}
