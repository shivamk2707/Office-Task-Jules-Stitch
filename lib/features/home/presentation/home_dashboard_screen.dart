import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F9F7).withOpacity(0.8),
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          'TaskFlow',
          style: TextStyle(
            fontFamily: 'Hanken Grotesk',
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF002620), // primary
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Color(0xFF002620)),
            onPressed: () {
              context.push('/notifications');
            },
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),

              // Morning Briefing Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Morning Briefing',
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF002620),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDEEEC),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Text(
                      'OCT 24, 2023',
                      style: TextStyle(
                        fontFamily: 'Hanken Grotesk',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.6,
                        color: const Color(0xFF404846),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // AI Briefing Card
              Container(
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: const Color(0xFFBDECE0), width: 1), // Gradient border approximated
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x0A0D3D35),
                      offset: Offset(0, 30),
                      blurRadius: 30,
                    ),
                    BoxShadow(
                      color: Color(0x050D3D35),
                      offset: Offset(0, 4),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.auto_awesome, color: Color(0xFF0D3D35), size: 16),
                        SizedBox(width: 8.w),
                        Text(
                          'AI INSIGHTS',
                          style: TextStyle(
                            fontFamily: 'Hanken Grotesk',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.6,
                            color: const Color(0xFF0D3D35),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Good morning, Julian. You have a focused day ahead.',
                      style: TextStyle(
                        fontFamily: 'Hanken Grotesk',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1A1C1B),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Based on your deadlines, we\'ve prioritized the Q4 Strategy Deck. Your peak focus time is predicted between 9:00 AM and 11:30 AM.',
                      style: TextStyle(
                        fontFamily: 'Hanken Grotesk',
                        fontSize: 16.sp,
                        height: 1.5,
                        color: const Color(0xFF404846),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF3F4F2),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Deep Work',
                                  style: TextStyle(
                                    fontFamily: 'Hanken Grotesk',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF404846),
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  '2.5 Hours',
                                  style: TextStyle(
                                    fontFamily: 'Hanken Grotesk',
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF002620),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF3F4F2),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Meetings',
                                  style: TextStyle(
                                    fontFamily: 'Hanken Grotesk',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF404846),
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  '2 Slots',
                                  style: TextStyle(
                                    fontFamily: 'Hanken Grotesk',
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF002620),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF3F4F2),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Energy Peak',
                                  style: TextStyle(
                                    fontFamily: 'Hanken Grotesk',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF404846),
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  'High',
                                  style: TextStyle(
                                    fontFamily: 'Hanken Grotesk',
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF002620),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40.h),

              // High Priority Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today's High-Priority",
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF002620),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.push('/tasks');
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'VIEW ALL',
                      style: TextStyle(
                        fontFamily: 'Hanken Grotesk',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.6,
                        color: const Color(0xFF002620),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // Task Card 1 (Active/Primary)
              Container(
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                  color: const Color(0xFF0D3D35),
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x0A0D3D35),
                      offset: Offset(0, 30),
                      blurRadius: 30,
                    ),
                    BoxShadow(
                      color: Color(0x050D3D35),
                      offset: Offset(0, 4),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.check_circle_outline, color: Color(0xFF7BA89D)),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Finalize Q4 Revenue Strategy',
                            style: TextStyle(
                              fontFamily: 'Hanken Grotesk',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              const Icon(Icons.schedule, color: Color(0xFF7BA89D), size: 14),
                              SizedBox(width: 4.w),
                              Text(
                                '09:00 AM',
                                style: TextStyle(
                                  fontFamily: 'Hanken Grotesk',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF7BA89D),
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF224E46).withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Text(
                                  'STRATEGY',
                                  style: TextStyle(
                                    fontFamily: 'Hanken Grotesk',
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16.h),

              // Task Card 2 (Secondary)
              Container(
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: const Color(0xFFE2E3E1).withOpacity(0.5)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x0A0D3D35),
                      offset: Offset(0, 30),
                      blurRadius: 30,
                    ),
                    BoxShadow(
                      color: Color(0x050D3D35),
                      offset: Offset(0, 4),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.radio_button_unchecked, color: Color(0xFFC0C8C5)),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Review Figma File',
                            style: TextStyle(
                              fontFamily: 'Hanken Grotesk',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF1A1C1B),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              const Icon(Icons.schedule, color: Color(0xFF717976), size: 14),
                              SizedBox(width: 4.w),
                              Text(
                                '11:00 AM',
                                style: TextStyle(
                                  fontFamily: 'Hanken Grotesk',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF717976),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xE6F9F9F7), // surface/90
          boxShadow: [
            BoxShadow(
              color: Color(0x0A0D3D35),
              offset: Offset(0, -4),
              blurRadius: 30,
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 8.h, top: 16.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Home (Active)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: const Color(0xFF0D3D35),
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: const Icon(Icons.home, color: Color(0xFF7BA89D)),
            ),
            // Calendar
            IconButton(
              icon: const Icon(Icons.calendar_today, color: Color(0xFF404846)),
              onPressed: () {
                context.go('/calendar');
              },
            ),
            // AI Chat
            IconButton(
              icon: const Icon(Icons.bolt, color: Color(0xFF404846)),
              onPressed: () {
                context.go('/ai');
              },
            ),
            // Profile
            IconButton(
              icon: const Icon(Icons.person_outline, color: Color(0xFF404846)),
              onPressed: () {
                context.push('/profile-edit');
              },
            ),
          ],
        ),
      ),
    );
  }
}
