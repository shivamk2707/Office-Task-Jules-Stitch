import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileEditingScreen extends StatelessWidget {
  const ProfileEditingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Edit Profile'),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                    child: Text(
                      'AL',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt, size: 20),
                        color: Theme.of(context).colorScheme.onPrimary,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Full Name', style: Theme.of(context).textTheme.labelSmall),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                initialValue: 'Alex Lee',
                decoration: const InputDecoration(
                  hintText: 'Enter your full name',
                ),
              ),
              SizedBox(height: 24.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Role', style: Theme.of(context).textTheme.labelSmall),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                initialValue: 'Product Manager',
                decoration: const InputDecoration(
                  hintText: 'Enter your role',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
