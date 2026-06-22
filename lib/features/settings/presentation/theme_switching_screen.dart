import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import "package:go_router/go_router.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter/material.dart';

class ThemeSwitchingScreen extends StatelessWidget {
  const ThemeSwitchingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme'),
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
              Text('Choose your preferred theme:',
                  style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 16.h),
              RadioListTile(
                value: ThemeMode.system,
                groupValue: ThemeMode.system, // mock for now
                onChanged: (val) {},
                title: const Text('System Default'),
              ),
              RadioListTile(
                value: ThemeMode.light,
                groupValue: ThemeMode.system, // mock for now
                onChanged: (val) {},
                title: const Text('Light'),
              ),
              RadioListTile(
                value: ThemeMode.dark,
                groupValue: ThemeMode.system, // mock for now
                onChanged: (val) {},
                title: const Text('Dark'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
