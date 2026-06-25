import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SetupWorkspaceScreen extends StatefulWidget {
  const SetupWorkspaceScreen({super.key});

  @override
  State<SetupWorkspaceScreen> createState() => _SetupWorkspaceScreenState();
}

class _SetupWorkspaceScreenState extends State<SetupWorkspaceScreen> {
  String _selectedTeamSize = 'Just me';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F9F7).withOpacity(0.8),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF002620)),
          onPressed: () => context.pop(),
        ),
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
          Center(
            child: Container(
              margin: EdgeInsets.only(right: 16.w),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: const Color(0xFFEDEEEC),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Text(
                'Step 2 of 3',
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF404846),
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Text(
                'Setup your workspace',
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 34.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF002620),
                  letterSpacing: -0.02,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Personalize your environment. This is where you and your team will collaborate and track high-impact goals.',
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 16.sp,
                  color: const Color(0xFF404846),
                  height: 1.5,
                ),
              ),
              SizedBox(height: 40.h),
              Container(
                padding: EdgeInsets.all(32.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.r),
                  border: Border.all(color: const Color(0xFFE2E3E1).withOpacity(0.5)),
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
                      'WORKSPACE NAME',
                      style: TextStyle(
                        fontFamily: 'Hanken Grotesk',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.6,
                        color: const Color(0xFF404846),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    TextFormField(
                      initialValue: 'Acme Strategic Projects',
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFF9F9F7),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: const Color(0xFFE2E3E1)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: const Color(0xFFE2E3E1)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: const Color(0xFF002620), width: 2),
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    Text(
                      'TEAM SIZE',
                      style: TextStyle(
                        fontFamily: 'Hanken Grotesk',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.6,
                        color: const Color(0xFF404846),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Wrap(
                      spacing: 12.w,
                      runSpacing: 12.h,
                      children: ['Just me', '2 - 10', '11 - 50', '51+'].map((size) {
                        bool isSelected = _selectedTeamSize == size;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedTeamSize = size;
                            });
                          },
                          child: Container(
                            width: (MediaQuery.of(context).size.width - 48.w - 64.w - 12.w) / 2, // approximation for 2 columns inside padding
                            height: 48.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: isSelected ? const Color(0xFF0D3D35) : Colors.white,
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(
                                color: isSelected ? const Color(0xFF0D3D35) : const Color(0xFFE2E3E1),
                              ),
                            ),
                            child: Text(
                              size,
                              style: TextStyle(
                                fontFamily: 'Hanken Grotesk',
                                fontSize: 14.sp,
                                color: isSelected ? const Color(0xFF7BA89D) : const Color(0xFF404846),
                                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 40.h),
                    SizedBox(
                      width: double.infinity,
                      height: 56.h,
                      child: ElevatedButton(
                        onPressed: () {
                          context.go('/personalize-ai-flow');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0D3D35),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        child: Text(
                          'Continue',
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
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
