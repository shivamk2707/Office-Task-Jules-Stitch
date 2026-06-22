import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import "package:go_router/go_router.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter/material.dart';

class PersonalizeStyleScreen extends StatefulWidget {
  const PersonalizeStyleScreen({super.key});

  @override
  State<PersonalizeStyleScreen> createState() => _PersonalizeStyleScreenState();
}

class _PersonalizeStyleScreenState extends State<PersonalizeStyleScreen> {
  String _selectedStyle = 'Agile / Scrum';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.h),
              Text(
                'Workflow Style',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 8.h),
              Text(
                'How do you prefer to manage tasks?',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              SizedBox(height: 32.h),
              _buildStyleCard(context, 'Agile / Scrum', 'Sprints, backlogs, and story points.'),
              SizedBox(height: 16.h),
              _buildStyleCard(context, 'Kanban', 'Boards, columns, and continuous flow.'),
              SizedBox(height: 32.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.push('/personalize-ai-integrations');
                  },
                  child: const Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStyleCard(BuildContext context, String title, String subtitle) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: RadioListTile<String>(
        value: title,
        groupValue: _selectedStyle,
        onChanged: (value) {
          if (value != null) {
            setState(() {
              _selectedStyle = value;
            });
          }
        },
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
