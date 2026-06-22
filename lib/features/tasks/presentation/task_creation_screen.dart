import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import "package:go_router/go_router.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter/material.dart';

class TaskCreationScreen extends StatelessWidget {
  const TaskCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
        title: const Text('Create New Task'),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('Save'),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Task Title', style: Theme.of(context).textTheme.labelSmall),
              SizedBox(height: 8.h),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'e.g., Prepare Q3 Report',
                ),
              ),
              SizedBox(height: 24.h),
              Text('Description',
                  style: Theme.of(context).textTheme.labelSmall),
              SizedBox(height: 8.h),
              TextFormField(
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: 'Add details...',
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date',
                            style: Theme.of(context).textTheme.labelSmall),
                        SizedBox(height: 8.h),
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.calendar_today, size: 18),
                          label: const Text('Today'),
                          style: OutlinedButton.styleFrom(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 12.h),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Time',
                            style: Theme.of(context).textTheme.labelSmall),
                        SizedBox(height: 8.h),
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.access_time, size: 18),
                          label: const Text('Set time'),
                          style: OutlinedButton.styleFrom(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 12.h),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Text('Priority', style: Theme.of(context).textTheme.labelSmall),
              SizedBox(height: 8.h),
              Wrap(
                spacing: 8.w,
                children: [
                  ChoiceChip(
                    label: const Text('High'),
                    selected: false,
                    onSelected: (bool selected) {},
                  ),
                  ChoiceChip(
                    label: const Text('Medium'),
                    selected: true,
                    onSelected: (bool selected) {},
                  ),
                  ChoiceChip(
                    label: const Text('Low'),
                    selected: false,
                    onSelected: (bool selected) {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
