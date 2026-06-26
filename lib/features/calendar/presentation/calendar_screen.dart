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

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  int _selectedDate = 25; // Example selected date based on agenda_3
  final List<String> _days = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN', 'MON'];
  final List<int> _dates = [23, 24, 25, 26, 27, 28, 29, 30];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AiColors.surfaceBright,
      appBar: AppBar(
        backgroundColor: AiColors.surfaceBright.withOpacity(0.9),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AiColors.onSurfaceVariant),
          onPressed: () => context.pop(),
        ),
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
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: isDesktop
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 8,
                        child: _buildMainContent(),
                      ),
                      SizedBox(width: 24.w),
                      Expanded(
                        flex: 4,
                        child: _buildRightPanel(),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildMainContent(),
                      SizedBox(height: 32.h),
                      _buildRightPanel(),
                    ],
                  ),
            );
          }
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'October 2023',
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    color: AiColors.primary,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'You have 4 tasks scheduled for today.',
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 14.sp,
                    color: AiColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.tune, size: 18.sp, color: AiColors.onSurfaceVariant),
              label: Text(
                'Filters',
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AiColors.onSurfaceVariant,
                ),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AiColors.outlineVariant.withOpacity(0.5)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 24.h),

        // Date Strip
        SizedBox(
          height: 80.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _dates.length,
            itemBuilder: (context, index) {
              final isSelected = _dates[index] == _selectedDate;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDate = _dates[index];
                  });
                },
                child: Container(
                  width: 60.w,
                  margin: EdgeInsets.only(right: 8.w),
                  decoration: BoxDecoration(
                    color: isSelected ? AiColors.primaryContainer : AiColors.surfaceBright,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: isSelected ? AiColors.primaryContainer : AiColors.outlineVariant.withOpacity(0.3),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _days[index],
                        style: TextStyle(
                          fontFamily: 'Hanken Grotesk',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: isSelected ? AiColors.onSecondaryContainer : AiColors.onSurfaceVariant,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        _dates[index].toString(),
                        style: TextStyle(
                          fontFamily: 'Hanken Grotesk',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: isSelected ? Colors.white : AiColors.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 32.h),

        // Agenda Feed
        _buildTimelineEvent(
          time: '09:00 AM',
          child: _buildEventCard(
            title: 'Strategic Quarterly Sync',
            tag: 'Internal',
            description: 'Reviewing Q4 growth targets and engineering bandwidth for the TaskFlow 2.0 release.',
            location: 'Conference Room A',
            attendees: 3,
          ),
        ),
        SizedBox(height: 16.h),

        _buildTimelineEvent(
          time: '11:30 AM',
          isAiSuggested: true,
          child: _buildAiSuggestionCard(),
        ),
        SizedBox(height: 16.h),

        _buildTimelineEvent(
          time: '01:00 PM',
          child: _buildEventCard(
            title: 'Lunch & Product Research',
            tag: 'Personal',
            description: 'Reading latest Apple HIG updates over coffee.',
            tagColor: AiColors.surfaceContainerHigh,
          ),
        ),
        SizedBox(height: 16.h),

        _buildTimelineEvent(
          time: '03:00 PM',
          child: _buildPriorityEventCard(),
        ),
      ],
    );
  }

  Widget _buildTimelineEvent({
    required String time,
    required Widget child,
    bool isAiSuggested = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 70.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time.split(' ')[0],
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: isAiSuggested ? AiColors.primary : AiColors.onSurfaceVariant,
                ),
              ),
              Text(
                time.split(' ')[1],
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: AiColors.outlineVariant,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 16.w),
        // Timeline line indicator
        Column(
          children: [
            Container(
              width: 12.w,
              height: 12.w,
              decoration: BoxDecoration(
                color: isAiSuggested ? AiColors.primary : AiColors.surfaceContainerHigh,
                shape: BoxShape.circle,
                border: Border.all(color: AiColors.surfaceBright, width: 2),
              ),
            ),
            Container(
              width: 2.w,
              height: 120.h, // Approx height, in reality it should match child height
              color: AiColors.outlineVariant.withOpacity(0.2),
            ),
          ],
        ),
        SizedBox(width: 16.w),
        Expanded(child: child),
      ],
    );
  }

  Widget _buildEventCard({
    required String title,
    required String tag,
    required String description,
    String? location,
    int? attendees,
    Color? tagColor,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
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
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AiColors.onSurface,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: tagColor ?? AiColors.secondaryContainer.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text(
                  tag,
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: AiColors.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            description,
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 14.sp,
              color: AiColors.onSurfaceVariant,
              height: 1.5,
            ),
          ),
          if (location != null || attendees != null) ...[
            SizedBox(height: 16.h),
            Row(
              children: [
                if (attendees != null) ...[
                  Row(
                    children: [
                      CircleAvatar(radius: 12.r, backgroundImage: const NetworkImage('https://i.pravatar.cc/150?u=1')),
                      Transform.translate(offset: Offset(-8.w, 0), child: CircleAvatar(radius: 12.r, backgroundImage: const NetworkImage('https://i.pravatar.cc/150?u=2'))),
                      Transform.translate(offset: Offset(-16.w, 0), child: CircleAvatar(radius: 12.r, backgroundImage: const NetworkImage('https://i.pravatar.cc/150?u=3'))),
                      Transform.translate(
                        offset: Offset(-24.w, 0),
                        child: CircleAvatar(
                          radius: 12.r,
                          backgroundColor: AiColors.surfaceContainerHigh,
                          child: Text(
                            '+$attendees',
                            style: TextStyle(fontSize: 10.sp, color: AiColors.onSurfaceVariant, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                const Spacer(),
                if (location != null)
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 14.sp, color: AiColors.outlineVariant),
                      SizedBox(width: 4.w),
                      Text(
                        location,
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
        ],
      ),
    );
  }

  Widget _buildAiSuggestionCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AiColors.primaryContainer,
        borderRadius: BorderRadius.circular(16.r),
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
          Row(
            children: [
              Icon(Icons.bolt, color: AiColors.secondaryFixed, size: 16.sp),
              SizedBox(width: 8.w),
              Text(
                'AI Task Suggestion',
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: AiColors.secondaryFixed,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            'Deep Work: Visual Token Refactoring',
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Based on your recent repo activity, now is the optimal time for focus. 90% chance of high productivity.',
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 14.sp,
              color: Colors.white.withOpacity(0.8),
              height: 1.5,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AiColors.secondaryFixed,
                  foregroundColor: AiColors.primaryContainer,
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  elevation: 0,
                ),
                child: Text(
                  'Accept & Block',
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'Reschedule',
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
    );
  }

  Widget _buildPriorityEventCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.priority_high, color: Color(0xFFBA1A1A), size: 16.sp),
                    SizedBox(width: 8.w),
                    Text(
                      'Design System Handover',
                      style: TextStyle(
                        fontFamily: 'Hanken Grotesk',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AiColors.onSurface,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  'With engineering team in London (Remote)',
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 14.sp,
                    color: AiColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: AiColors.outlineVariant),
        ],
      ),
    );
  }

  Widget _buildRightPanel() {
    return Column(
      children: [
        _buildDayInsightsCard(),
        SizedBox(height: 24.h),
        _buildPendingTasksCard(),
      ],
    );
  }

  Widget _buildDayInsightsCard() {
    return Container(
      padding: EdgeInsets.all(24.w),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.auto_awesome, color: AiColors.secondary, size: 20.sp),
              SizedBox(width: 8.w),
              Text(
                'Day Insights',
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PRODUCTIVITY SCORE',
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700,
                      color: AiColors.outlineVariant,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '84',
                        style: TextStyle(
                          fontFamily: 'Hanken Grotesk',
                          fontSize: 34.sp,
                          fontWeight: FontWeight.w700,
                          color: AiColors.primary,
                          letterSpacing: -0.68,
                        ),
                      ),
                      Text(
                        '/100',
                        style: TextStyle(
                          fontFamily: 'Hanken Grotesk',
                          fontSize: 14.sp,
                          color: AiColors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'FOCUS BLOCKS',
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700,
                      color: AiColors.outlineVariant,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Morning: High\nAfternoon: Med',
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 12.sp,
                      color: AiColors.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AiColors.primary.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AiColors.primary.withOpacity(0.2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '"Your calendar is 15% more congested than last Wednesday. I recommend postponing the \'Logo Exploration\' to Thursday morning to preserve your deep work block."',
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 14.sp,
                    color: AiColors.onSurfaceVariant,
                    height: 1.5,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  'Optimize My Day',
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
        ],
      ),
    );
  }

  Widget _buildPendingTasksCard() {
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
          Text(
            'PENDING TASKS',
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              color: AiColors.onSurfaceVariant,
              letterSpacing: 0.6,
            ),
          ),
          SizedBox(height: 16.h),
          _buildTaskItem('Finalize icon sets'),
          _buildTaskItem('Email stakeholders'),
        ],
      ),
    );
  }

  Widget _buildTaskItem(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Icon(Icons.check_box_outline_blank, color: AiColors.outlineVariant, size: 20.sp),
          SizedBox(width: 12.w),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 14.sp,
              color: AiColors.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
