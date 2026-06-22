import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EmptyProjectsScreen extends StatelessWidget {
  const EmptyProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.folder_open,
                size: 80.r,
                color: Theme.of(context).colorScheme.outlineVariant,
              ),
              SizedBox(height: 32.h),
              Text(
                'No Projects Yet',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              Text(
                'Create your first project to start organizing tasks with your team.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),
              ElevatedButton.icon(
                onPressed: () {
                  context.push('/create-project');
                },
                icon: const Icon(Icons.add),
                label: const Text('Create Project'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
