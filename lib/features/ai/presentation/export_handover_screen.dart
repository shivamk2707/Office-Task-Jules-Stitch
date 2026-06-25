import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ExportHandoverScreen extends StatelessWidget {
  const ExportHandoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Export Handover',
          style: TextStyle(
            fontFamily: 'Hanken Grotesk',
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF002620),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF002620)),
          onPressed: () => context.pop(),
        ),
        backgroundColor: const Color(0xFFF9F9F7),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF9F9F7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Export Handover',
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1A1C1B),
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'This is a functional placeholder for the Export Handover feature. It demonstrates routing, styling, and basic architecture.',
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 16.sp,
                    color: const Color(0xFF404846),
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 32.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(24.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x0A0D3D35),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.construction, size: 48.sp, color: const Color(0xFF7BA89D)),
                      SizedBox(height: 16.h),
                      Text(
                        'Feature Module',
                        style: TextStyle(
                          fontFamily: 'Hanken Grotesk',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
