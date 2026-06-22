import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import "package:go_router/go_router.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter/material.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              context.push('/task-edit');
            },
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Complete Q3 Financial Report',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 16),
                  SizedBox(width: 8.w),
                  const Text('Due: Oct 15, 2026'),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  const Icon(Icons.flag, size: 16, color: Colors.red),
                  SizedBox(width: 8.w),
                  const Text('High Priority',
                      style: TextStyle(color: Colors.red)),
                ],
              ),
              SizedBox(height: 32.h),
              Text(
                'Description',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.h),
              const Text(
                'Compile and review all financial statements for Q3. Ensure compliance with internal guidelines and present to the board.',
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {
                    // Mark as complete logic
                  },
                  child: const Text('Mark as Complete'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
