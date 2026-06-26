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

class PersonalizeFlowScreen extends StatefulWidget {
  const PersonalizeFlowScreen({super.key});

  @override
  State<PersonalizeFlowScreen> createState() => _PersonalizeFlowScreenState();
}

class _PersonalizeFlowScreenState extends State<PersonalizeFlowScreen> {
  final List<String> _selectedFocus = [];

  final List<Map<String, dynamic>> _focusAreas = [
    {'icon': Icons.description_outlined, 'title': 'Deep Work'},
    {'icon': Icons.groups_outlined, 'title': 'Team Management'},
    {'icon': Icons.account_tree_outlined, 'title': 'Project Planning'},
    {'icon': Icons.campaign_outlined, 'title': 'Marketing & Sales'},
    {'icon': Icons.code_outlined, 'title': 'Software Development'},
    {'icon': Icons.more_horiz_outlined, 'title': 'Other'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AiColors.surfaceBright,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 48.h),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 540.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildMainPanel(),
                  SizedBox(height: 32.h),
                  _buildTipPanel(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMainPanel() {
    return Container(
      padding: EdgeInsets.all(32.w),
      decoration: BoxDecoration(
        color: AiColors.surfaceContainerLowest.withOpacity(0.9),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: AiColors.outlineVariant.withOpacity(0.3)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A0D3D35),
            blurRadius: 30,
            offset: Offset(0, 30),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: AiColors.surfaceBright,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: AiColors.outlineVariant.withOpacity(0.5)),
            ),
            child: Icon(Icons.bolt, color: AiColors.primary, size: 24.sp),
          ),
          SizedBox(height: 32.h),
          Text(
            'Personalize Your AI Flow',
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
            'Select your primary focus areas to help TaskFlow tailor its suggestions to your specific needs.',
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 16.sp,
              color: AiColors.onSurfaceVariant,
              height: 1.5,
            ),
          ),
          SizedBox(height: 48.h),
          Wrap(
            spacing: 12.w,
            runSpacing: 12.h,
            children: _focusAreas.map((area) => _buildFocusChip(area)).toList(),
          ),
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
                  "I'LL DO THIS LATER",
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.6,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _selectedFocus.isNotEmpty
                    ? () => context.go('/personalize-ai-role') // Using hypothetical next route based on stitching flow
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
    );
  }

  Widget _buildFocusChip(Map<String, dynamic> area) {
    final bool isSelected = _selectedFocus.contains(area['title']);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedFocus.remove(area['title']);
          } else {
            _selectedFocus.add(area['title']);
          }
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? AiColors.primaryContainer : AiColors.surfaceBright,
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(
            color: isSelected ? AiColors.primaryContainer : AiColors.outlineVariant.withOpacity(0.5),
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AiColors.primaryContainer.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  )
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              area['icon'],
              size: 20.sp,
              color: isSelected ? AiColors.secondaryFixed : AiColors.onSurfaceVariant,
            ),
            SizedBox(width: 8.w),
            Text(
              area['title'],
              style: TextStyle(
                fontFamily: 'Hanken Grotesk',
                fontSize: 14.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected ? Colors.white : AiColors.onSurface,
              ),
            ),
            if (isSelected) ...[
              SizedBox(width: 8.w),
              Icon(
                Icons.check_circle,
                size: 16.sp,
                color: AiColors.secondaryFixed,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTipPanel() {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AiColors.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AiColors.primary.withOpacity(0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: AiColors.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.smart_toy, color: AiColors.secondaryFixed, size: 16.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Why does AI need this?",
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AiColors.primary,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "By understanding your focus, TaskFlow can prioritize relevant notifications, suggest appropriate templates, and auto-organize your workspace efficiently.",
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 14.sp,
                    color: AiColors.onSurfaceVariant,
                    height: 1.5,
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
