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

class AiAssistantUiScreen extends StatelessWidget {
  const AiAssistantUiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AiColors.surfaceBright,
      appBar: AppBar(
        title: Text(
          'TaskFlow',
          style: TextStyle(
            fontFamily: 'Hanken Grotesk',
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            color: AiColors.primary,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AiColors.onSurfaceVariant),
          onPressed: () => context.pop(),
        ),
        backgroundColor: AiColors.surfaceBright.withOpacity(0.8),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AiColors.onSurfaceVariant),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: AiColors.onSurfaceVariant),
            onPressed: () {},
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: CircleAvatar(
              radius: 16.r,
              backgroundColor: AiColors.surfaceContainerHigh,
              backgroundImage: const NetworkImage('https://i.pravatar.cc/150?u=a042581f4e29026704d'),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isDesktop = constraints.maxWidth > 800;
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: isDesktop
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 8,
                        child: _buildLeftColumn(),
                      ),
                      SizedBox(width: 24.w),
                      Expanded(
                        flex: 4,
                        child: _buildAiWorkspace(),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLeftColumn(),
                      SizedBox(height: 32.h),
                      _buildAiWorkspace(),
                    ],
                  ),
            );
          }
        ),
      ),
    );
  }

  Widget _buildLeftColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Bento Grid 1
        Row(
          children: [
            Expanded(child: _buildProductivityScoreCard()),
            SizedBox(width: 16.w),
            Expanded(child: _buildWorkflowCard()),
          ],
        ),
        SizedBox(height: 16.h),

        // Bento Grid 2
        Row(
          children: [
            Expanded(child: _buildScheduleOptimizerCard()),
            SizedBox(width: 16.w),
            Expanded(child: _buildFocusModeCard()),
          ],
        ),
        SizedBox(height: 24.h),

        // Next Focus Tasks Section
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Next Focus Tasks',
              style: TextStyle(
                fontFamily: 'Hanken Grotesk',
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AiColors.onSurface,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'View All',
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AiColors.secondary,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        _buildTaskCard(
          title: 'Refine UI Design for Dashboard',
          category: 'Design System',
          time: '10:00 AM',
          priority: 'HIGH',
        ),
        SizedBox(height: 12.h),
        _buildTaskCard(
          title: 'Draft Q3 Performance Report',
          category: 'Management',
          time: '1:00 PM',
          priority: 'MEDIUM',
        ),
      ],
    );
  }

  Widget _buildProductivityScoreCard() {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AiColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12.r),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Weekly Productivity',
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AiColors.onSurfaceVariant,
                  letterSpacing: 0.6,
                ),
              ),
              Icon(Icons.more_horiz, color: AiColors.outlineVariant, size: 20.sp),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '87%',
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 34.sp,
                  fontWeight: FontWeight.w700,
                  color: AiColors.primary,
                  letterSpacing: -0.68,
                ),
              ),
              SizedBox(width: 8.w),
              Icon(Icons.trending_up, color: AiColors.secondary, size: 20.sp),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildGraphBar(0.4),
              _buildGraphBar(0.6),
              _buildGraphBar(0.8),
              _buildGraphBar(0.5),
              _buildGraphBar(1.0, isToday: true),
              _buildGraphBar(0.0),
              _buildGraphBar(0.0),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ['M', 'T', 'W', 'T', 'F', 'S', 'S']
                .map((day) => Text(
                      day,
                      style: TextStyle(
                        fontFamily: 'Hanken Grotesk',
                        fontSize: 12.sp,
                        color: AiColors.onSurfaceVariant,
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildGraphBar(double heightFactor, {bool isToday = false}) {
    return Container(
      width: 12.w,
      height: 40.h * heightFactor,
      decoration: BoxDecoration(
        color: isToday ? AiColors.primary : AiColors.outlineVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(4.r),
      ),
    );
  }

  Widget _buildWorkflowCard() {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AiColors.primary,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x260D3D35),
            blurRadius: 20,
            offset: Offset(0, 10),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(Icons.auto_awesome, color: Colors.white, size: 24.sp),
          ),
          SizedBox(height: 16.h),
          Text(
            'Automate Your Workflow',
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'AI will analyze your behavior and suggest routines.',
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 14.sp,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'Setup Now ->',
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AiColors.secondaryFixed,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleOptimizerCard() {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AiColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AiColors.outlineVariant.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.schedule, color: AiColors.onSurfaceVariant, size: 24.sp),
          SizedBox(height: 16.h),
          Text(
            'Schedule Optimizer',
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AiColors.onSurface,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Reorganize 4 overlapping tasks',
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 14.sp,
              color: AiColors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFocusModeCard() {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AiColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AiColors.outlineVariant.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.tune, color: AiColors.onSurfaceVariant, size: 24.sp),
          SizedBox(height: 16.h),
          Text(
            'Focus Mode',
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AiColors.onSurface,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Block notifications for 2 hours',
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 14.sp,
              color: AiColors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskCard({
    required String title,
    required String category,
    required String time,
    required String priority,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AiColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AiColors.outlineVariant.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            width: 24.w,
            height: 24.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AiColors.outlineVariant),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AiColors.onSurface,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  '$category • $time',
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 14.sp,
                    color: AiColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: priority == 'HIGH' ? AiColors.secondaryContainer : AiColors.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Text(
              priority,
              style: TextStyle(
                fontFamily: 'Hanken Grotesk',
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
                color: priority == 'HIGH' ? AiColors.onSecondaryContainer : AiColors.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAiWorkspace() {
    return Container(
      height: 600.h,
      decoration: BoxDecoration(
        color: AiColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16.r),
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
        children: [
          // Header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AiColors.outlineVariant.withOpacity(0.2))),
              color: AiColors.surfaceContainerHigh.withOpacity(0.5),
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 32.w,
                      height: 32.w,
                      decoration: const BoxDecoration(
                        color: AiColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.bolt, color: AiColors.secondaryFixed, size: 18.sp),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      'AI Workspace',
                      style: TextStyle(
                        fontFamily: 'Hanken Grotesk',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AiColors.primary,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AiColors.secondaryContainer,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text(
                    'Active',
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AiColors.onSecondaryContainer,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Chat Area
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.w),
              children: [
                _buildChatBubble(
                  text: "Hello! I've analyzed your upcoming schedule. You have a gap at 2:00 PM. Would you like to schedule focused deep work then?",
                  isAi: true,
                ),
                SizedBox(height: 16.h),
                _buildChatBubble(
                  text: "Yes, allocate 90 minutes for the dashboard design.",
                  isAi: false,
                ),
                SizedBox(height: 16.h),
                _buildChatBubble(
                  text: "Scheduled. I've also activated Focus Mode for that duration.",
                  isAi: true,
                ),
              ],
            ),
          ),

          // Suggestions
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                _buildSuggestionChip('Set Daily Goal'),
                _buildSuggestionChip('Analyze Stress'),
                _buildSuggestionChip('Summarize Tasks'),
              ],
            ),
          ),
          SizedBox(height: 12.h),

          // Input Area
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: AiColors.outlineVariant.withOpacity(0.2))),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.mic, color: AiColors.onSurfaceVariant),
                  onPressed: () {},
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    decoration: BoxDecoration(
                      color: AiColors.surfaceBright,
                      borderRadius: BorderRadius.circular(24.r),
                      border: Border.all(color: AiColors.outlineVariant.withOpacity(0.5)),
                    ),
                    child: Text(
                      'Ask TaskFlow AI...',
                      style: TextStyle(
                        fontFamily: 'Hanken Grotesk',
                        fontSize: 14.sp,
                        color: AiColors.onSurfaceVariant.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Container(
                  decoration: const BoxDecoration(
                    color: AiColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatBubble({required String text, required bool isAi}) {
    return Row(
      mainAxisAlignment: isAi ? MainAxisAlignment.start : MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isAi) ...[
          Container(
            width: 28.w,
            height: 28.w,
            decoration: const BoxDecoration(
              color: AiColors.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.smart_toy, color: AiColors.secondaryFixed, size: 14.sp),
          ),
          SizedBox(width: 12.w),
        ],
        Flexible(
          child: Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: isAi ? AiColors.surfaceBright : AiColors.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
                bottomLeft: isAi ? Radius.zero : Radius.circular(12.r),
                bottomRight: isAi ? Radius.circular(12.r) : Radius.zero,
              ),
              border: isAi ? Border.all(color: AiColors.outlineVariant.withOpacity(0.3)) : null,
            ),
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Hanken Grotesk',
                fontSize: 14.sp,
                color: isAi ? AiColors.onSurface : Colors.white,
                height: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSuggestionChip(String text) {
    return Container(
      margin: EdgeInsets.only(right: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AiColors.surfaceContainerHigh.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AiColors.outlineVariant.withOpacity(0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Hanken Grotesk',
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: AiColors.onSurfaceVariant,
        ),
      ),
    );
  }
}
