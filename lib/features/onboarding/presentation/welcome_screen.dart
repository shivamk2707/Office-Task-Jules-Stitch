import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100.h),
                Icon(
                  Icons.check_circle_outline,
                  size: 100.r,
                  color: const Color(0xFF0D3D35),
                ),
                SizedBox(height: 32.h),
                Text(
                  'Welcome to TaskFlow',
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 34.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1A1C1B),
                    letterSpacing: -0.02,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                Text(
                  'Focus, flow, and finish your tasks effortlessly with our premium AI-driven workspace.',
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 16.sp,
                    color: const Color(0xFF404846),
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 100.h),
                SizedBox(
                  width: double.infinity,
                  height: 56.h,
                  child: ElevatedButton(
                    onPressed: () {
                      context.push('/signin');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0D3D35),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        fontFamily: 'Hanken Grotesk',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                TextButton(
                  onPressed: () {
                    context.push('/signin');
                  },
                  child: Text(
                    'Already have an account? Sign In',
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF35675D),
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
