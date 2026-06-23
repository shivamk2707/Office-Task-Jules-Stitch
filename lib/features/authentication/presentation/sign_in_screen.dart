import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F7),
      body: Stack(
        children: [
          // Background ambient gradient 1
          Positioned(
            top: -10.h,
            right: -10.w,
            child: Container(
              width: 150.w,
              height: 150.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFB6EADD).withOpacity(0.2), // secondary-container
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
          // Background ambient gradient 2
          Positioned(
            bottom: -10.h,
            left: -10.w,
            child: Container(
              width: 120.w,
              height: 120.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFBDECE0).withOpacity(0.2), // primary-fixed
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
            child: Column(
              children: [
                // Top Navigation
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'TaskFlow',
                        style: TextStyle(
                          fontFamily: 'Hanken Grotesk',
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF002620), // primary
                          letterSpacing: -0.01,
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 48.h),

                          // Branding/Greeting
                          Text(
                            'Welcome Back',
                            style: TextStyle(
                              fontFamily: 'Hanken Grotesk',
                              fontSize: 34.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF1A1C1B), // on-surface
                              letterSpacing: -0.02,
                              height: 1.2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Focus, flow, and finish your tasks.',
                            style: TextStyle(
                              fontFamily: 'Hanken Grotesk',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF404846), // on-surface-variant
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 40.h),

                          // Login Card
                          Container(
                            padding: EdgeInsets.all(32.w),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF), // surface-container-lowest
                              borderRadius: BorderRadius.circular(32.r),
                              border: Border.all(
                                color: const Color(0xFFE2E3E1).withOpacity(0.5), // surface-container-highest
                              ),
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
                                // Email Field
                                Padding(
                                  padding: EdgeInsets.only(left: 4.w, bottom: 8.h),
                                  child: Text(
                                    'EMAIL ADDRESS',
                                    style: TextStyle(
                                      fontFamily: 'Hanken Grotesk',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.05 * 12.sp,
                                      color: const Color(0xFF404846), // on-surface-variant
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 56.h,
                                  child: TextFormField(
                                    style: TextStyle(
                                      fontFamily: 'Hanken Grotesk',
                                      fontSize: 14.sp,
                                      color: const Color(0xFF1A1C1B),
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'name@company.com',
                                      hintStyle: TextStyle(
                                        color: const Color(0xFF717976).withOpacity(0.5),
                                      ),
                                      filled: true,
                                      fillColor: const Color(0xFFF9F9F7), // background
                                      contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16.r),
                                        borderSide: const BorderSide(color: Color(0xFFC0C8C5)), // outline-variant
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16.r),
                                        borderSide: const BorderSide(color: Color(0xFFC0C8C5)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16.r),
                                        borderSide: const BorderSide(color: Color(0xFF002620), width: 2), // primary
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 24.h),

                                // Password Field
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 4.w),
                                      child: Text(
                                        'PASSWORD',
                                        style: TextStyle(
                                          fontFamily: 'Hanken Grotesk',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.05 * 12.sp,
                                          color: const Color(0xFF404846), // on-surface-variant
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        context.push('/forgot-password');
                                      },
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        minimumSize: Size.zero,
                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      child: Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                          fontFamily: 'Hanken Grotesk',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.05 * 12.sp,
                                          color: const Color(0xFF35675D), // secondary
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.h),
                                SizedBox(
                                  height: 56.h,
                                  child: TextFormField(
                                    obscureText: _obscureText,
                                    style: TextStyle(
                                      fontFamily: 'Hanken Grotesk',
                                      fontSize: 14.sp,
                                      color: const Color(0xFF1A1C1B),
                                    ),
                                    decoration: InputDecoration(
                                      hintText: '••••••••',
                                      filled: true,
                                      fillColor: const Color(0xFFF9F9F7),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscureText ? Icons.visibility : Icons.visibility_off,
                                          color: const Color(0xFF404846),
                                          size: 20.sp,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        },
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16.r),
                                        borderSide: const BorderSide(color: Color(0xFFC0C8C5)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16.r),
                                        borderSide: const BorderSide(color: Color(0xFFC0C8C5)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16.r),
                                        borderSide: const BorderSide(color: Color(0xFF002620), width: 2),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 24.h),

                                // Submit Button
                                SizedBox(
                                  width: double.infinity,
                                  height: 56.h,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      context.go('/home');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF0D3D35), // primary-container
                                      foregroundColor: const Color(0xFFFFFFFF), // on-primary
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16.r),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Sign In',
                                          style: TextStyle(
                                            fontFamily: 'Hanken Grotesk',
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFFFFFFFF),
                                          ),
                                        ),
                                        SizedBox(width: 8.w),
                                        Icon(Icons.arrow_forward, size: 18.sp),
                                      ],
                                    ),
                                  ),
                                ),

                                // Divider
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 32.h),
                                  child: Row(
                                    children: [
                                      const Expanded(child: Divider(color: Color(0xFFE2E3E1))), // surface-container-highest
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                                        child: Text(
                                          'OR CONTINUE WITH',
                                          style: TextStyle(
                                            fontFamily: 'Hanken Grotesk',
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.05 * 12.sp,
                                            color: const Color(0xFF404846).withOpacity(0.6),
                                          ),
                                        ),
                                      ),
                                      const Expanded(child: Divider(color: Color(0xFFE2E3E1))),
                                    ],
                                  ),
                                ),

                                // Social Logins
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 56.h,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF9F9F7),
                                          border: Border.all(color: const Color(0xFFC0C8C5)),
                                          borderRadius: BorderRadius.circular(16.r),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x05000000),
                                              offset: Offset(0, 2),
                                              blurRadius: 4,
                                            )
                                          ]
                                        ),
                                        child: TextButton.icon(
                                          onPressed: () {},
                                          icon: Icon(Icons.g_mobiledata, color: Colors.blue, size: 24.sp),
                                          label: Text(
                                            'Google',
                                            style: TextStyle(
                                              fontFamily: 'Hanken Grotesk',
                                              fontSize: 14.sp,
                                              color: const Color(0xFF1A1C1B),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 16.w),
                                    Expanded(
                                      child: Container(
                                        height: 56.h,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF9F9F7),
                                          border: Border.all(color: const Color(0xFFC0C8C5)),
                                          borderRadius: BorderRadius.circular(16.r),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x05000000),
                                              offset: Offset(0, 2),
                                              blurRadius: 4,
                                            )
                                          ]
                                        ),
                                        child: TextButton.icon(
                                          onPressed: () {},
                                          icon: Icon(Icons.apple, color: const Color(0xFF1A1C1B), size: 20.sp),
                                          label: Text(
                                            'Apple',
                                            style: TextStyle(
                                              fontFamily: 'Hanken Grotesk',
                                              fontSize: 14.sp,
                                              color: const Color(0xFF1A1C1B),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // Footer Links
                          SizedBox(height: 32.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  fontFamily: 'Hanken Grotesk',
                                  fontSize: 14.sp,
                                  color: const Color(0xFF404846),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.push('/signup');
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                                  minimumSize: Size.zero,
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text(
                                  'Create Account',
                                  style: TextStyle(
                                    fontFamily: 'Hanken Grotesk',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF35675D),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 48.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
