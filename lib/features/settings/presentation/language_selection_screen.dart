import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import "package:go_router/go_router.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter/material.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Select Language:',
                  style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 16.h),
              ListTile(
                title: const Text('English (US)'),
                trailing: const Icon(Icons.check, color: Colors.green),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Spanish'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('French'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
