import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import "package:go_router/go_router.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter/material.dart';

class FocusTimerScreen extends StatelessWidget {
  const FocusTimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Focus Timer'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 250.r,
                    height: 250.r,
                    child: CircularProgressIndicator(
                      value: 0.75, // Placeholder value
                      strokeWidth: 12.w,
                      backgroundColor:
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '25:00',
                        style:
                            Theme.of(context).textTheme.displayLarge?.copyWith(
                                  fontSize: 64.sp,
                                ),
                      ),
                      Text(
                        'Focusing on Design Review',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 64.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Pause'),
                ),
                SizedBox(width: 16.w),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Complete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
