import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'TaskFlow',
          style: TextStyle(
            fontFamily: 'Hanken Grotesk',
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF002620),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF002620)),
          onPressed: () => context.pop(),
        ),
        actions: [
          TextButton(
            onPressed: () => context.push('/signin'),
            child: Text(
              'LOGIN',
              style: TextStyle(
                fontFamily: 'Hanken Grotesk',
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF404846),
                letterSpacing: 0.6,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: -50.h,
            right: -50.w,
            child: Container(
              width: 250.w,
              height: 250.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFB6EADD).withOpacity(0.2),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x33B6EADD),
                    blurRadius: 120,
                    spreadRadius: 20,
                  )
                ]
              ),
            ),
          ),
          Positioned(
            bottom: -50.h,
            left: -50.w,
            child: Container(
              width: 200.w,
              height: 200.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFBDECE0).withOpacity(0.2),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x33BDECE0),
                    blurRadius: 100,
                    spreadRadius: 20,
                  )
                ]
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Container(
                  padding: EdgeInsets.all(32.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.r),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x0A0D3D35),
                        offset: Offset(0, 30),
                        blurRadius: 60,
                      ),
                      BoxShadow(
                        color: Color(0x050D3D35),
                        offset: Offset(0, 4),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create your account',
                        style: TextStyle(
                          fontFamily: 'Hanken Grotesk',
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF002620),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Start your 14-day free trial today.',
                        style: TextStyle(
                          fontFamily: 'Hanken Grotesk',
                          fontSize: 14.sp,
                          color: const Color(0xFF404846),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        'FULL NAME',
                        style: TextStyle(
                          fontFamily: 'Hanken Grotesk',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.6,
                          color: const Color(0xFF404846),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'John Doe',
                          filled: true,
                          fillColor: const Color(0xFFF3F4F2),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: const Color(0xFFC0C8C5)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: const Color(0xFFC0C8C5)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: const Color(0xFF002620), width: 2),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'EMAIL ADDRESS',
                        style: TextStyle(
                          fontFamily: 'Hanken Grotesk',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.6,
                          color: const Color(0xFF404846),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'john@example.com',
                          filled: true,
                          fillColor: const Color(0xFFF3F4F2),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: const Color(0xFFC0C8C5)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: const Color(0xFFC0C8C5)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: const Color(0xFF002620), width: 2),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'PASSWORD',
                        style: TextStyle(
                          fontFamily: 'Hanken Grotesk',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.6,
                          color: const Color(0xFF404846),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      TextFormField(
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          hintText: '••••••••',
                          filled: true,
                          fillColor: const Color(0xFFF3F4F2),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText ? Icons.visibility : Icons.visibility_off,
                              color: const Color(0xFF404846),
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: const Color(0xFFC0C8C5)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: const Color(0xFFC0C8C5)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: const Color(0xFF002620), width: 2),
                          ),
                        ),
                      ),
                      SizedBox(height: 32.h),
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: ElevatedButton(
                          onPressed: () {
                            context.go('/setup-workspace');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0D3D35),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                          child: Text(
                            'Create Account',
                            style: TextStyle(
                              fontFamily: 'Hanken Grotesk',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
