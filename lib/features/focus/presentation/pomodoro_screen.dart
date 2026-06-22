import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Pomodoro Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(24.w),
        children: [
          const ListTile(
            title: Text('Work Duration'),
            trailing: Text('25 min'),
          ),
          const Divider(),
          const ListTile(
            title: Text('Short Break'),
            trailing: Text('5 min'),
          ),
          const Divider(),
          const ListTile(
            title: Text('Long Break'),
            trailing: Text('15 min'),
          ),
          SizedBox(height: 32.h),
          ElevatedButton(
            onPressed: () {
              context.push('/focus-timer');
            },
            child: const Text('Start Session'),
          ),
        ],
      ),
    );
  }
}
