import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AiColors {
  static const Color primary = Color(0xFF002620);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color outlineVariant = Color(0xFFC0C8C5);
  static const Color onSurface = Color(0xFF1A1C1B);
  static const Color onSurfaceVariant = Color(0xFF404846);
  static const Color surfaceBright = Color(0xFFF9F9F7);
  static const Color primaryContainer = Color(0xFF0D3D35);
  static const Color secondary = Color(0xFF35675D);
  static const Color secondaryContainer = Color(0xFFB6EADD);
  static const Color onSecondaryContainer = Color(0xFF3A6B61);
  static const Color surfaceContainerHigh = Color(0xFFE8E8E6);
  static const Color secondaryFixed = Color(0xFFB9EDE0);
}

class PersonalizeRoleScreen extends StatefulWidget {
  const PersonalizeRoleScreen({super.key});

  @override
  State<PersonalizeRoleScreen> createState() => _PersonalizeRoleScreenState();
}

class _PersonalizeRoleScreenState extends State<PersonalizeRoleScreen> {
  String? _selectedRole;

  final List<Map<String, dynamic>> _roles = [
    {
      'icon': Icons.palette_outlined,
      'title': 'Designer',
      'subtitle': 'UI/UX, Visual, Branding',
    },
    {
      'icon': Icons.code_outlined,
      'title': 'Developer',
      'subtitle': 'Frontend, Backend, Architecture',
    },
    {
      'icon': Icons.dashboard_outlined,
      'title': 'Product Manager',
      'subtitle': 'Roadmaps, Strategy, Agile',
    },
    {
      'icon': Icons.corporate_fare_outlined,
      'title': 'Executive',
      'subtitle': 'Leadership, Planning, Operations',
    },
    {
      'icon': Icons.work_outline,
      'title': 'Freelancer',
      'subtitle': 'Independent Work, Client Management',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AiColors.surfaceBright,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AiColors.onSurfaceVariant),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 540.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Step 1 of 5',
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AiColors.secondary,
                      letterSpacing: 0.7,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Choose Your Role',
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 34.sp,
                      fontWeight: FontWeight.w700,
                      color: AiColors.onSurface,
                      letterSpacing: -0.68,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "Select the path that best describes your daily focus. We'll tailor the AI to your specific productivity needs.",
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 16.sp,
                      color: AiColors.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 48.h),
                  ..._roles.map((role) => _buildRoleCard(role)).toList(),
                  SizedBox(height: 48.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => context.go('/dashboard'),
                        style: TextButton.styleFrom(
                          foregroundColor: AiColors.onSurfaceVariant,
                        ),
                        child: Text(
                          "I'll do this later",
                          style: TextStyle(
                            fontFamily: 'Hanken Grotesk',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _selectedRole != null
                            ? () => context.go('/personalize-ai-style')
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AiColors.primaryContainer,
                          foregroundColor: Colors.white,
                          disabledBackgroundColor: AiColors.outlineVariant.withOpacity(0.5),
                          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            fontFamily: 'Hanken Grotesk',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard(Map<String, dynamic> role) {
    final bool isSelected = _selectedRole == role['title'];
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRole = role['title'];
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: isSelected ? AiColors.surfaceContainerHigh.withOpacity(0.5) : AiColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? AiColors.primary : AiColors.outlineVariant.withOpacity(0.3),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? []
              : [
                  BoxShadow(
                    color: const Color(0x0A0D3D35),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: isSelected ? AiColors.primary : AiColors.surfaceBright,
                shape: BoxShape.circle,
                border: isSelected ? null : Border.all(color: AiColors.outlineVariant.withOpacity(0.5)),
              ),
              child: Icon(
                role['icon'],
                size: 24.sp,
                color: isSelected ? Colors.white : AiColors.primary,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    role['title'],
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AiColors.onSurface,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    role['subtitle'],
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 14.sp,
                      color: AiColors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: AiColors.primary,
                size: 24.sp,
              )
            else
              Container(
                width: 24.w,
                height: 24.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AiColors.outlineVariant.withOpacity(0.5)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
