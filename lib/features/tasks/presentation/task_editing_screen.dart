import 'package:flutter/material.dart';



class TaskEditingScreen extends StatelessWidget {
  const TaskEditingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
        title: const Text('Edit Task'),
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
                initialValue: 'Design Review',
                decoration: const InputDecoration(
                  hintText: 'e.g., Prepare Q3 Report',
                ),
              ),
              // ... rest of fields similar to creation
            ],
          ),
        ),
      ),
    );
  }
}
