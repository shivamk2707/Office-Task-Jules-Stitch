import "package:go_router/go_router.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter/material.dart';

class TeamPulseScreen extends StatelessWidget {
  const TeamPulseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Team Pulse')),
      body: const Center(child: Text('Team Pulse Screen')),
    );
  }
}
