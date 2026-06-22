import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AiAssistantUiScreen extends StatelessWidget {
  const AiAssistantUiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Assistant'),
      ),
      body: ListView(
        padding: EdgeInsets.all(24.w),
        children: [
          Container(
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.secondaryContainer,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.auto_awesome, color: Theme.of(context).colorScheme.onPrimaryContainer),
                SizedBox(height: 16.h),
                Text(
                  'How can I help you today?',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                SizedBox(height: 24.h),
                ElevatedButton(
                  onPressed: () {
                    context.push('/chat');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
                    foregroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  child: const Text('Start Chat'),
                ),
              ],
            ),
          ),
          SizedBox(height: 32.h),
          Text('Suggested Actions', style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(height: 16.h),
          ListTile(
            leading: const Icon(Icons.summarize_outlined),
            title: const Text('Summarize my day'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.schedule_outlined),
            title: const Text('Schedule next week'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
