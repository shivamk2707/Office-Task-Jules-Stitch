import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AllProjectsScreen extends StatelessWidget {
  const AllProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('All Projects'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              context.push('/create-project');
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(24.w),
        children: [
          _buildProjectCard(context, 'Website Redesign', '12 tasks', 0.8),
          SizedBox(height: 16.h),
          _buildProjectCard(context, 'Marketing Campaign Q4', '5 tasks', 0.3),
        ],
      ),
    );
  }

  Widget _buildProjectCard(BuildContext context, String title, String subtitle, double progress) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(height: 4.h),
          Text(subtitle, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant)),
          SizedBox(height: 16.h),
          LinearProgressIndicator(value: progress),
        ],
      ),
    );
  }
}
