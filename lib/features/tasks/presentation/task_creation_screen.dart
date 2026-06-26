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

class TaskCreationScreen extends StatefulWidget {
  const TaskCreationScreen({super.key});

  @override
  State<TaskCreationScreen> createState() => _TaskCreationScreenState();
}

class _TaskCreationScreenState extends State<TaskCreationScreen> {
  String _selectedPriority = 'High';
  String _selectedProject = 'Apollo Brand Identity';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AiColors.surfaceBright,
      appBar: AppBar(
        backgroundColor: AiColors.surfaceBright.withOpacity(0.9),
        elevation: 0,
        leading: TextButton(
          onPressed: () => context.pop(),
          style: TextButton.styleFrom(
            foregroundColor: AiColors.onSurfaceVariant,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
          ),
          child: Text(
            'Cancel',
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        leadingWidth: 80.w,
        title: Text(
          'New Task',
          style: TextStyle(
            fontFamily: 'Hanken Grotesk',
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: AiColors.onSurface,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: ElevatedButton(
              onPressed: () => context.pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AiColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                elevation: 0,
              ),
              child: Text(
                'Create',
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: AiColors.onSurface,
                ),
                decoration: InputDecoration(
                  hintText: 'Task Title',
                  hintStyle: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: AiColors.outlineVariant,
                  ),
                  border: InputBorder.none,
                ),
              ),
              TextField(
                maxLines: null,
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 16.sp,
                  color: AiColors.onSurfaceVariant,
                ),
                decoration: InputDecoration(
                  hintText: 'Description',
                  hintStyle: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 16.sp,
                    color: AiColors.outlineVariant,
                  ),
                  border: InputBorder.none,
                ),
              ),
              SizedBox(height: 24.h),

              _buildSectionTitle('Project'),
              SizedBox(height: 12.h),
              _buildDropdownField(
                icon: Icons.folder_open,
                value: _selectedProject,
                items: ['Apollo Brand Identity', 'Lunar System Launch', 'Internal Workspace'],
                onChanged: (val) {
                  if (val != null) {
                    setState(() => _selectedProject = val);
                  }
                },
              ),
              SizedBox(height: 16.h),

              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.bolt, size: 18.sp, color: AiColors.secondary),
                label: Text(
                  'AI Generate Subtasks',
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AiColors.onSurface,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: AiColors.outlineVariant.withOpacity(0.5)),
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  minimumSize: Size(double.infinity, 48.h),
                ),
              ),
              SizedBox(height: 24.h),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionTitle('Priority'),
                        SizedBox(height: 12.h),
                        Row(
                          children: [
                            _buildPriorityChip('High'),
                            _buildPriorityChip('Med'),
                            _buildPriorityChip('Low'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionTitle('Category'),
                        SizedBox(height: 12.h),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                              decoration: BoxDecoration(
                                color: AiColors.secondaryContainer.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Text(
                                'Design',
                                style: TextStyle(
                                  fontFamily: 'Hanken Grotesk',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AiColors.secondary,
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                              decoration: BoxDecoration(
                                color: AiColors.surfaceContainerHigh.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Text(
                                '+ Tag',
                                style: TextStyle(
                                  fontFamily: 'Hanken Grotesk',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AiColors.onSurfaceVariant,
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
              SizedBox(height: 24.h),

              Row(
                children: [
                  Expanded(
                    child: _buildDateTimeField(Icons.calendar_today, 'Deadline', 'Oct 24, 2023'),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: _buildDateTimeField(Icons.schedule, 'Time', '10:30 AM'),
                  ),
                ],
              ),
              SizedBox(height: 24.h),

              _buildSectionTitle('Assignees'),
              SizedBox(height: 12.h),
              Row(
                children: [
                  CircleAvatar(radius: 20.r, backgroundImage: const NetworkImage('https://i.pravatar.cc/150?u=1')),
                  Transform.translate(offset: Offset(-8.w, 0), child: CircleAvatar(radius: 20.r, backgroundImage: const NetworkImage('https://i.pravatar.cc/150?u=2'))),
                  Transform.translate(
                    offset: Offset(-16.w, 0),
                    child: Container(
                      width: 40.r,
                      height: 40.r,
                      decoration: BoxDecoration(
                        color: AiColors.surfaceBright,
                        shape: BoxShape.circle,
                        border: Border.all(color: AiColors.outlineVariant.withOpacity(0.5), style: BorderStyle.solid),
                      ),
                      child: Icon(Icons.add, color: AiColors.onSurfaceVariant, size: 20.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),

              _buildSectionTitle('Attachments'),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    decoration: BoxDecoration(
                      color: AiColors.surfaceContainerLowest,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: AiColors.outlineVariant.withOpacity(0.3)),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.upload_file, color: AiColors.onSurfaceVariant, size: 20.sp),
                        SizedBox(width: 8.w),
                        Text(
                          'Upload',
                          style: TextStyle(
                            fontFamily: 'Hanken Grotesk',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AiColors.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: AiColors.surfaceContainerHigh.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.description, color: AiColors.secondary, size: 16.sp),
                        SizedBox(width: 8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Brief.pdf',
                              style: TextStyle(
                                fontFamily: 'Hanken Grotesk',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: AiColors.onSurface,
                              ),
                            ),
                            Text(
                              '2.4 MB',
                              style: TextStyle(
                                fontFamily: 'Hanken Grotesk',
                                fontSize: 10.sp,
                                color: AiColors.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 48.h),

              Center(
                child: Text(
                  'Private task • Visible only to you and assignees',
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 12.sp,
                    color: AiColors.outlineVariant,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Hanken Grotesk',
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        color: AiColors.onSurfaceVariant,
        letterSpacing: 0.6,
      ),
    );
  }

  Widget _buildDropdownField({
    required IconData icon,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AiColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AiColors.outlineVariant.withOpacity(0.3)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: value,
          icon: Icon(Icons.expand_more, color: AiColors.onSurfaceVariant),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Row(
                children: [
                  Icon(icon, size: 20.sp, color: AiColors.onSurfaceVariant),
                  SizedBox(width: 12.w),
                  Text(
                    item,
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 16.sp,
                      color: AiColors.onSurface,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildDateTimeField(IconData icon, String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AiColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AiColors.outlineVariant.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16.sp, color: AiColors.outlineVariant),
              SizedBox(width: 8.w),
              Text(
                label,
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 12.sp,
                  color: AiColors.outlineVariant,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AiColors.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriorityChip(String label) {
    final bool isSelected = _selectedPriority == label;
    return GestureDetector(
      onTap: () {
        setState(() => _selectedPriority = label);
      },
      child: Container(
        margin: EdgeInsets.only(right: 8.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected
              ? (label == 'High' ? Color(0xFFBA1A1A).withOpacity(0.1) : AiColors.primaryContainer)
              : AiColors.surfaceBright,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected
                ? (label == 'High' ? Color(0xFFBA1A1A) : AiColors.primaryContainer)
                : AiColors.outlineVariant.withOpacity(0.5),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Hanken Grotesk',
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: isSelected
                ? (label == 'High' ? Color(0xFFBA1A1A) : Colors.white)
                : AiColors.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
