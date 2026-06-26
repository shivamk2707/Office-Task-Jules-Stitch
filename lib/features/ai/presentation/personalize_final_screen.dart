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

class PersonalizeFinalScreen extends StatefulWidget {
  const PersonalizeFinalScreen({super.key});

  @override
  State<PersonalizeFinalScreen> createState() => _PersonalizeFinalScreenState();
}

class _PersonalizeFinalScreenState extends State<PersonalizeFinalScreen> {
  String? _selectedFrequency = 'Proactive'; // Default selection based on UI

  final List<Map<String, dynamic>> _frequencies = [
    {
      'icon': Icons.visibility_off_outlined,
      'title': 'Minimalist',
      'subtitle': 'Only when asked. Silent in the background until explicitly triggered.',
    },
    {
      'icon': Icons.tips_and_updates_outlined,
      'title': 'Proactive',
      'subtitle': 'Suggestions & Recaps. Intelligent nudges and morning summaries to keep you ahead.',
    },
    {
      'icon': Icons.auto_fix_high,
      'title': 'Co-Pilot',
      'subtitle': 'Full workflow assistance. Auto-prioritizing tasks and generating drafts in real-time.',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'AI Interaction Frequency',
                        style: TextStyle(
                          fontFamily: 'Hanken Grotesk',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AiColors.secondary,
                          letterSpacing: 0.7,
                        ),
                      ),
                      Text(
                        'Final Step',
                        style: TextStyle(
                          fontFamily: 'Hanken Grotesk',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AiColors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Container(
                    width: 48.w,
                    height: 48.w,
                    decoration: BoxDecoration(
                      color: AiColors.surfaceContainerLowest,
                      shape: BoxShape.circle,
                      border: Border.all(color: AiColors.outlineVariant.withOpacity(0.5)),
                    ),
                    child: Icon(Icons.bolt, color: AiColors.primary, size: 24.sp),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'Tailor your intelligence.',
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 34.sp,
                      fontWeight: FontWeight.w700,
                      color: AiColors.onSurface,
                      letterSpacing: -0.68,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "Define how TaskFlow's AI integrates into your daily workflow. From silent assistant to active partner.",
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 16.sp,
                      color: AiColors.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 48.h),

                  ..._frequencies.map((freq) => _buildFrequencyCard(freq)).toList(),

                  SizedBox(height: 32.h),
                  _buildInsightPanel(),
                  SizedBox(height: 48.h),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _selectedFrequency != null
                          ? () => context.go('/dashboard')
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AiColors.primaryContainer,
                        foregroundColor: Colors.white,
                        disabledBackgroundColor: AiColors.outlineVariant.withOpacity(0.5),
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Complete Setup',
                        style: TextStyle(
                          fontFamily: 'Hanken Grotesk',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
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
    );
  }

  Widget _buildFrequencyCard(Map<String, dynamic> freq) {
    final bool isSelected = _selectedFrequency == freq['title'];
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFrequency = freq['title'];
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: isSelected ? AiColors.surfaceContainerHigh.withOpacity(0.5) : AiColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? AiColors.primary : AiColors.outlineVariant.withOpacity(0.3),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: isSelected ? AiColors.primary : AiColors.surfaceBright,
                shape: BoxShape.circle,
              ),
              child: Icon(
                freq['icon'],
                size: 20.sp,
                color: isSelected ? Colors.white : AiColors.primary,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    freq['title'],
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AiColors.onSurface,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    freq['subtitle'],
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
            SizedBox(width: 16.w),
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

  Widget _buildInsightPanel() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AiColors.secondaryContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AiColors.secondary.withOpacity(0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, color: AiColors.secondary, size: 20.sp),
          SizedBox(width: 12.w),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 14.sp,
                  color: AiColors.onSurfaceVariant,
                  height: 1.5,
                ),
                children: [
                  const TextSpan(text: '84% of high-performers prefer '),
                  TextSpan(
                    text: 'Proactive',
                    style: TextStyle(fontWeight: FontWeight.w600, color: AiColors.onSurface),
                  ),
                  const TextSpan(text: ' mode for balanced focus.'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
