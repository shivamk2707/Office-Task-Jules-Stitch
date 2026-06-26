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

class KnowledgeBaseScreen extends StatelessWidget {
  const KnowledgeBaseScreen({super.key});

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
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'AI Knowledge Base',
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
                'The core engine of your productivity. Here, the AI distills your habits, preferences, and project nuances into actionable intelligence.',
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 16.sp,
                  color: AiColors.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 32.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Brand & Voice',
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AiColors.onSurface,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.add, size: 16.sp, color: AiColors.primary),
                    label: Text(
                      'Add New',
                      style: TextStyle(
                        fontFamily: 'Hanken Grotesk',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AiColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              _buildKnowledgeCard(
                icon: Icons.record_voice_over_outlined,
                title: 'Brand Voice: Professional & Calm',
                description: 'AI avoids exclamation marks and uses structured, neutral syntax. Prefers "we" over "I" in external communications.',
                confidence: '98%',
                appliedTo: '4 Projects',
              ),
              SizedBox(height: 16.h),
              _buildKnowledgeCard(
                icon: Icons.palette_outlined,
                title: 'Visual Identity: Apple Minimalist',
                description: 'High-key lighting, generous white space, and forest green accents. Icons must be 2pt stroke width.',
                confidence: '92%',
                appliedTo: null,
              ),
              SizedBox(height: 32.h),

              Text(
                'Workflow Preferences',
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AiColors.onSurface,
                ),
              ),
              SizedBox(height: 16.h),
              _buildKnowledgeCard(
                icon: Icons.space_dashboard_outlined,
                title: 'Layout Pref: Minimalist Grid',
                description: 'AI prioritizes 1200px centered fixed grids and suppresses sidebars during deep work sessions.',
                isActiveRule: true,
              ),
              SizedBox(height: 16.h),
              _buildInsightCard(),
              SizedBox(height: 32.h),
              _buildHealthCard(),
              SizedBox(height: 48.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildKnowledgeCard({
    required IconData icon,
    required String title,
    required String description,
    String? confidence,
    String? appliedTo,
    bool isActiveRule = false,
  }) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AiColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AiColors.outlineVariant.withOpacity(0.3)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x050D3D35),
            blurRadius: 10,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: AiColors.surfaceBright,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: AiColors.outlineVariant.withOpacity(0.3)),
                    ),
                    child: Icon(icon, size: 20.sp, color: AiColors.onSurfaceVariant),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AiColors.onSurface,
                    ),
                  ),
                ],
              ),
              Icon(Icons.edit_note, color: AiColors.outlineVariant, size: 20.sp),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            description,
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 14.sp,
              color: AiColors.onSurfaceVariant,
              height: 1.5,
            ),
          ),
          if (confidence != null || isActiveRule) ...[
            SizedBox(height: 16.h),
            Row(
              children: [
                if (isActiveRule)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: AiColors.secondaryContainer.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      'Active Rule',
                      style: TextStyle(
                        fontFamily: 'Hanken Grotesk',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AiColors.secondary,
                      ),
                    ),
                  )
                else ...[
                  Text(
                    'Confidence: $confidence',
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AiColors.secondary,
                    ),
                  ),
                  if (appliedTo != null) ...[
                    SizedBox(width: 16.w),
                    Text(
                      'Applied to: $appliedTo',
                      style: TextStyle(
                        fontFamily: 'Hanken Grotesk',
                        fontSize: 12.sp,
                        color: AiColors.outlineVariant,
                      ),
                    ),
                  ]
                ],
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInsightCard() {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.bolt, color: AiColors.secondary, size: 20.sp),
                  SizedBox(width: 8.w),
                  Text(
                    'New Insight: Evening Deep-Work',
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AiColors.onSurface,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      foregroundColor: AiColors.outlineVariant,
                    ),
                    child: Text(
                      'Ignore',
                      style: TextStyle(
                        fontFamily: 'Hanken Grotesk',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      foregroundColor: AiColors.primary,
                    ),
                    child: Text(
                      'Approve',
                      style: TextStyle(
                        fontFamily: 'Hanken Grotesk',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            "I've noticed your highest completion rates for \"Strategy\" tasks occur between 8 PM and 10 PM. Should I schedule complex items then?",
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 14.sp,
              color: AiColors.onSurfaceVariant,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthCard() {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AiColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AiColors.outlineVariant.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.auto_awesome, color: AiColors.secondary, size: 20.sp),
              SizedBox(width: 8.w),
              Text(
                'Knowledge Health',
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AiColors.onSurface,
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '94%',
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 34.sp,
                  fontWeight: FontWeight.w700,
                  color: AiColors.primary,
                  letterSpacing: -0.68,
                ),
              ),
              SizedBox(width: 12.w),
              Text(
                'Context Accuracy',
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 14.sp,
                  color: AiColors.onSurfaceVariant,
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AiColors.surfaceBright,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AiColors.outlineVariant.withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Refinement Suggested',
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AiColors.onSurfaceVariant,
                    letterSpacing: 0.6,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  '"Project Mercury" has 12 unlinked concepts. Link them to improve task prioritization.',
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 14.sp,
                    color: AiColors.onSurface,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  'Start Linking',
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AiColors.primary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Current knowledge graph: 428 nodes',
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 12.sp,
                  color: AiColors.outlineVariant,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.sync, size: 16.sp, color: AiColors.outlineVariant),
                  SizedBox(width: 4.w),
                  Text(
                    'Sync Preferences',
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 12.sp,
                      color: AiColors.outlineVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
