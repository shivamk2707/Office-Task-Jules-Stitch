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

class PersonalizeStyleScreen extends StatefulWidget {
  const PersonalizeStyleScreen({super.key});

  @override
  State<PersonalizeStyleScreen> createState() => _PersonalizeStyleScreenState();
}

class _PersonalizeStyleScreenState extends State<PersonalizeStyleScreen> {
  String? _selectedStyle;

  final List<Map<String, dynamic>> _styles = [
    {
      'icon': Icons.bolt,
      'title': 'Fast-Paced & Urgent',
      'subtitle': 'Best for high-volume environments where quick decision-making and rapid context switching are essential for success.',
    },
    {
      'icon': Icons.biotech_outlined,
      'title': 'Deep Focus & Analytical',
      'subtitle': 'Ideal for complex problem-solving where long blocks of uninterrupted time and deep data synthesis are prioritized.',
    },
    {
      'icon': Icons.groups_outlined,
      'title': 'Collaborative & Open',
      'subtitle': 'Focuses on shared knowledge, continuous feedback loops, and fluid communication across distributed teams.',
    },
    {
      'icon': Icons.castle_outlined,
      'title': 'Structured & Disciplined',
      'subtitle': 'Perfect for those who rely on strict time-blocking, rigid categorization, and methodical progression through tasks.',
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
                    'Step 2 of 5',
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
                    'Select Your Workflow Style',
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
                    "How do you prefer to tackle your daily objectives? We'll calibrate the AI to match your natural rhythm.",
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 16.sp,
                      color: AiColors.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 48.h),

                  // Grid of cards instead of list
                  GridView.count(
                    crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 16.h,
                    crossAxisSpacing: 16.w,
                    childAspectRatio: MediaQuery.of(context).size.width > 600 ? 0.8 : 2.0,
                    children: _styles.map((style) => _buildStyleCard(style)).toList(),
                  ),

                  SizedBox(height: 48.h),
                  _buildInsightPanel(),
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
                          "Save for Later",
                          style: TextStyle(
                            fontFamily: 'Hanken Grotesk',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _selectedStyle != null
                            ? () => context.go('/personalize-ai-integrations')
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
                          'Continue to Step 3',
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

  Widget _buildStyleCard(Map<String, dynamic> style) {
    final bool isSelected = _selectedStyle == style['title'];
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedStyle = style['title'];
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: isSelected ? AiColors.primary : AiColors.surfaceBright,
                    shape: BoxShape.circle,
                    border: isSelected ? null : Border.all(color: AiColors.outlineVariant.withOpacity(0.5)),
                  ),
                  child: Icon(
                    style['icon'],
                    size: 24.sp,
                    color: isSelected ? Colors.white : AiColors.primary,
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
            SizedBox(height: 24.h),
            Text(
              style['title'],
              style: TextStyle(
                fontFamily: 'Hanken Grotesk',
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AiColors.onSurface,
              ),
            ),
            SizedBox(height: 8.h),
            Expanded(
              child: Text(
                style['subtitle'],
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 14.sp,
                  color: AiColors.onSurfaceVariant,
                  height: 1.5,
                ),
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInsightPanel() {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AiColors.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AiColors.primary.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.auto_awesome, color: AiColors.secondary, size: 20.sp),
              SizedBox(width: 8.w),
              Text(
                "AI INSIGHT",
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: AiColors.secondary,
                  letterSpacing: 0.6,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            "“Flow isn't about doing more; it's about doing what matters in the way you do it best.”",
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 16.sp,
              fontStyle: FontStyle.italic,
              color: AiColors.onSurfaceVariant,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
