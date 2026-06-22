import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import "package:go_router/go_router.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter/material.dart';

class SetupWorkspaceScreen extends StatelessWidget {
  const SetupWorkspaceScreen({super.key});

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
                'Setup Workspace',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 8.h),
              Text(
                'Tell us a bit about your team and how you plan to use the app.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              SizedBox(height: 32.h),
              Text('Workspace Name', style: Theme.of(context).textTheme.labelSmall),
              SizedBox(height: 8.h),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'e.g., Acme Corp Design Team',
                ),
              ),
              SizedBox(height: 24.h),
              Text('Team Size', style: Theme.of(context).textTheme.labelSmall),
              SizedBox(height: 8.h),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  hintText: 'Select team size',
                ),
                items: const [
                  DropdownMenuItem(value: '1-10', child: Text('1-10')),
                  DropdownMenuItem(value: '11-50', child: Text('11-50')),
                  DropdownMenuItem(value: '51+', child: Text('51+')),
                ],
                onChanged: (value) {},
              ),
              SizedBox(height: 48.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.push('/personalize-ai-flow');
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
}
