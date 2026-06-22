import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import "package:go_router/go_router.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.h),
              Text(
                'Enter OTP',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 8.h),
              Text(
                'We sent a 6-digit code to your email.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              SizedBox(height: 32.h),
              // Simplified OTP input for now, consider using pin_code_fields package for better UI
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: '000000',
                  counterText: '',
                ),
                maxLength: 6,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 32.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.push('/verification-success');
                  },
                  child: const Text('Verify'),
                ),
              ),
              SizedBox(height: 24.h),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Resend Code'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
