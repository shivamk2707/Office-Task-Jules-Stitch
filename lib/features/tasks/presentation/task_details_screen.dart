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

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  final TextEditingController _commentController = TextEditingController();

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
            icon: const Icon(Icons.edit_outlined, color: AiColors.onSurfaceVariant),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: AiColors.onSurfaceVariant),
            onPressed: () {},
          ),
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
                        child: _buildRightSidebar(),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildMainContent(),
                      SizedBox(height: 32.h),
                      _buildRightSidebar(),
                      SizedBox(height: 32.h),
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: AiColors.secondaryContainer.withOpacity(0.5),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Text(
                'UI/UX Design',
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AiColors.secondary,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: const Color(0xFFBA1A1A).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Text(
                'HIGH PRIORITY',
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFFBA1A1A),
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Text(
          'About us Website Design',
          style: TextStyle(
            fontFamily: 'Hanken Grotesk',
            fontSize: 34.sp,
            fontWeight: FontWeight.w700,
            color: AiColors.onSurface,
            letterSpacing: -0.68,
            height: 1.2,
          ),
        ),
        SizedBox(height: 24.h),

        // Meta Info Row
        Row(
          children: [
            Expanded(child: _buildMetaItem('DUE DATE', '21 July 2025', Icons.calendar_today)),
            Expanded(child: _buildMetaItem('TIME', '10:30 AM', Icons.schedule)),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'STATUS',
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700,
                      color: AiColors.outlineVariant,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: AiColors.primaryContainer,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      'In Progress',
                      style: TextStyle(
                        fontFamily: 'Hanken Grotesk',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ASSIGNEE',
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
                    children: [
                      CircleAvatar(radius: 12.r, backgroundImage: const NetworkImage('https://i.pravatar.cc/150?u=a1')),
                      Transform.translate(offset: Offset(-8.w, 0), child: CircleAvatar(radius: 12.r, backgroundImage: const NetworkImage('https://i.pravatar.cc/150?u=a2'))),
                      Transform.translate(
                        offset: Offset(-16.w, 0),
                        child: CircleAvatar(
                          radius: 12.r,
                          backgroundColor: AiColors.surfaceContainerHigh,
                          child: Text(
                            '+2',
                            style: TextStyle(fontSize: 10.sp, color: AiColors.onSurfaceVariant, fontWeight: FontWeight.w600),
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
        SizedBox(height: 32.h),

        Text(
          'Description',
          style: TextStyle(
            fontFamily: 'Hanken Grotesk',
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AiColors.onSurface,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          "Crafting a compelling 'About Us' page that resonates with our core brand values of growth, stability, and professional excellence. The design should leverage the new forest-inspired palette and emphasize our commitment to AI-assisted productivity. We need to ensure the storytelling is visual, using high-end photography and subtle parallax effects.",
          style: TextStyle(
            fontFamily: 'Hanken Grotesk',
            fontSize: 16.sp,
            color: AiColors.onSurfaceVariant,
            height: 1.6,
          ),
        ),
        SizedBox(height: 32.h),

        _buildSubtasks(),
        SizedBox(height: 32.h),
        _buildAttachments(),
        SizedBox(height: 32.h),
        _buildComments(),
      ],
    );
  }

  Widget _buildMetaItem(String label, String value, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Hanken Grotesk',
            fontSize: 10.sp,
            fontWeight: FontWeight.w700,
            color: AiColors.outlineVariant,
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Icon(icon, size: 16.sp, color: AiColors.outlineVariant),
            SizedBox(width: 8.w),
            Text(
              value,
              style: TextStyle(
                fontFamily: 'Hanken Grotesk',
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AiColors.onSurface,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSubtasks() {
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
              Text(
                'Task Breakdown',
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AiColors.onSurface,
                ),
              ),
              Text(
                '40% COMPLETE',
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                  color: AiColors.secondary,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: LinearProgressIndicator(
              value: 0.4,
              minHeight: 8.h,
              backgroundColor: AiColors.surfaceContainerHigh,
              valueColor: const AlwaysStoppedAnimation<Color>(AiColors.secondary),
            ),
          ),
          SizedBox(height: 24.h),
          _buildSubtaskItem(
            title: 'User Research & Competitive Analysis',
            isCompleted: true,
            subtitle: 'Completed by Sarah L. • Yesterday',
          ),
          _buildSubtaskItem(
            title: 'Wireframing',
            isCompleted: false,
            isActive: true,
          ),
          _buildSubtaskItem(
            title: 'UI Design & Prototyping',
            isCompleted: false,
          ),
          SizedBox(height: 16.h),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.add, size: 18.sp, color: AiColors.primary),
            label: Text(
              'ADD NEW SUBTASK',
              style: TextStyle(
                fontFamily: 'Hanken Grotesk',
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: AiColors.primary,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubtaskItem({required String title, required bool isCompleted, bool isActive = false, String? subtitle}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
            color: isCompleted ? AiColors.secondary : AiColors.outlineVariant,
            size: 24.sp,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 16.sp,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                    color: isCompleted ? AiColors.onSurfaceVariant : AiColors.onSurface,
                    decoration: isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
                if (subtitle != null) ...[
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 12.sp,
                      color: AiColors.outlineVariant,
                    ),
                  ),
                ],
                if (isActive) ...[
                  SizedBox(height: 4.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: AiColors.secondaryContainer.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      'ACTIVE TASK',
                      style: TextStyle(
                        fontFamily: 'Hanken Grotesk',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                        color: AiColors.secondary,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          Icon(Icons.drag_indicator, color: AiColors.outlineVariant, size: 20.sp),
        ],
      ),
    );
  }

  Widget _buildAttachments() {
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
                  Icon(Icons.attach_file, color: AiColors.onSurfaceVariant, size: 20.sp),
                  SizedBox(width: 8.w),
                  Text(
                    'Attachments (3)',
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AiColors.onSurface,
                    ),
                  ),
                ],
              ),
              Icon(Icons.expand_more, color: AiColors.onSurfaceVariant, size: 24.sp),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: AiColors.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(8.r),
                    image: const DecorationImage(
                      image: NetworkImage('https://via.placeholder.com/150/0D3D35/FFFFFF?text=Design1'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: Icon(Icons.visibility, color: Colors.white, size: 20.sp),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Container(
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: AiColors.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(8.r),
                    image: const DecorationImage(
                      image: NetworkImage('https://via.placeholder.com/150/35675D/FFFFFF?text=Design2'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: Icon(Icons.visibility, color: Colors.white, size: 20.sp),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Container(
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: AiColors.surfaceBright,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: AiColors.outlineVariant.withOpacity(0.5), style: BorderStyle.solid),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.upload, color: AiColors.outlineVariant, size: 24.sp),
                      SizedBox(height: 8.h),
                      Text(
                        'UPLOAD',
                        style: TextStyle(
                          fontFamily: 'Hanken Grotesk',
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w700,
                          color: AiColors.outlineVariant,
                          letterSpacing: 0.5,
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
    );
  }

  Widget _buildComments() {
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
                  Icon(Icons.chat_bubble_outline, color: AiColors.onSurfaceVariant, size: 20.sp),
                  SizedBox(width: 8.w),
                  Text(
                    'Comments',
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AiColors.onSurface,
                    ),
                  ),
                ],
              ),
              Icon(Icons.expand_more, color: AiColors.onSurfaceVariant, size: 24.sp),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            'No comments yet. Start the conversation!',
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 14.sp,
              color: AiColors.outlineVariant,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              CircleAvatar(radius: 16.r, backgroundImage: const NetworkImage('https://i.pravatar.cc/150?u=me')),
              SizedBox(width: 12.w),
              Expanded(
                child: TextField(
                  controller: _commentController,
                  decoration: InputDecoration(
                    hintText: 'Add a comment...',
                    hintStyle: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 14.sp,
                      color: AiColors.outlineVariant,
                    ),
                    filled: true,
                    fillColor: AiColors.surfaceBright,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.r),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.send, color: AiColors.primary),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRightSidebar() {
    return Column(
      children: [
        _buildAiWorkspaceCard(),
        SizedBox(height: 24.h),
        _buildProjectContextCard(),
      ],
    );
  }

  Widget _buildAiWorkspaceCard() {
    return Container(
      padding: EdgeInsets.all(24.w),
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
              Icon(Icons.bolt, color: AiColors.secondaryFixed, size: 20.sp),
              SizedBox(width: 8.w),
              Text(
                'AI Workspace',
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Text(
            'SUGGESTION',
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 10.sp,
              fontWeight: FontWeight.w700,
              color: AiColors.secondaryFixed,
              letterSpacing: 0.6,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "\"Based on your 'Wireframing' step, I recommend exploring a 3-column bento grid for the team section to maintain consistency with the homepage. I can generate a quick low-fi draft if needed.\"",
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 14.sp,
              color: Colors.white.withOpacity(0.9),
              height: 1.5,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AiColors.secondaryFixed,
              foregroundColor: AiColors.primaryContainer,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              elevation: 0,
            ),
            child: Text(
              'Generate Draft',
              style: TextStyle(
                fontFamily: 'Hanken Grotesk',
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectContextCard() {
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
          Text(
            'Project',
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              color: AiColors.onSurfaceVariant,
              letterSpacing: 0.6,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Icon(Icons.folder_open, color: AiColors.primary, size: 24.sp),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  'Growth & Expansion',
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AiColors.onSurface,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
