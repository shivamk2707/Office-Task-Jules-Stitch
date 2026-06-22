import "package:go_router/go_router.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter/material.dart';

class ProjectChatScreen extends StatelessWidget {
  const ProjectChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Project Chat')),
      body: const Center(child: Text('Project Chat Screen')),
    );
  }
}
