import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../blocs/task_bloc.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state is TaskLoading || state is TaskInitial) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        // For simplicity, we just grab the first task to show details in this view
        final tasks = (state as TaskLoaded).tasks;
        if (tasks.isEmpty) {
          return const Scaffold(body: Center(child: Text("No Tasks")));
        }
        final task = tasks.first;
        bool isHighPriority = task.priority.toLowerCase() == 'high';

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
            actions: [
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.bolt, color: Color(0xFF0D3D35), size: 16),
                label: Text(
                  'SUMMARIZE',
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF0D3D35),
                    letterSpacing: 0.6,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.more_vert, color: Color(0xFF002620)),
                onPressed: () {},
              ),
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),

                  // Status & Priority header
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: const Color(0xFFBDECE0).withOpacity(0.3),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Text(
                          task.status.toUpperCase(),
                          style: TextStyle(
                            fontFamily: 'Hanken Grotesk',
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF00201B),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      if (isHighPriority)
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFDAD6).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(16.r),
                            border: Border.all(color: const Color(0xFFFFDAD6)),
                          ),
                          child: Text(
                            'HIGH PRIORITY',
                            style: TextStyle(
                              fontFamily: 'Hanken Grotesk',
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF93000A),
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 24.h),

                  // Title
                  Text(
                    task.title,
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 34.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF002620),
                      height: 1.2,
                      letterSpacing: -0.02,
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // Description
                  Text(
                    task.description.isEmpty ? 'No description provided.' : task.description,
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF404846),
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 40.h),

                  // Subtasks Section
                  Row(
                    children: [
                      const Icon(Icons.checklist, color: Color(0xFF002620), size: 20),
                      SizedBox(width: 8.w),
                      Text(
                        'Sub-tasks',
                        style: TextStyle(
                          fontFamily: 'Hanken Grotesk',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF002620),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  // Subtask 1
                  Container(
                    margin: EdgeInsets.only(bottom: 12.h),
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x050D3D35),
                          offset: Offset(0, 4),
                          blurRadius: 4,
                        )
                      ]
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 24.w,
                          height: 24.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFF717976), width: 2),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Text(
                            'Initial brainstorming session with creative directors',
                            style: TextStyle(
                              fontFamily: 'Hanken Grotesk',
                              fontSize: 14.sp,
                              color: const Color(0xFF1A1C1B),
                            ),
                          ),
                        ),
                        Text(
                          'Today',
                          style: TextStyle(
                            fontFamily: 'Hanken Grotesk',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF404846),
                            letterSpacing: 0.6,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 40.h),

                  // Meta Data Sidebar representation at bottom for mobile
                  Container(
                    padding: EdgeInsets.all(24.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x0A0D3D35),
                          offset: Offset(0, 30),
                          blurRadius: 30,
                        ),
                        BoxShadow(
                          color: Color(0x050D3D35),
                          offset: Offset(0, 4),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Assignee
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ASSIGNEE',
                              style: TextStyle(
                                fontFamily: 'Hanken Grotesk',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.5,
                                color: const Color(0xFF404846),
                              ),
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 12.r,
                                  backgroundColor: const Color(0xFFE2E3E1),
                                  child: const Icon(Icons.person, size: 16, color: Colors.white),
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  'David Miller',
                                  style: TextStyle(
                                    fontFamily: 'Hanken Grotesk',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF002620),
                                  ),
                                ),
                                const Icon(Icons.expand_more, size: 16, color: Color(0xFF404846)),
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: const Divider(color: Color(0x4DC0C8C5)),
                        ),
                        // Due Date
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'DUE DATE',
                              style: TextStyle(
                                fontFamily: 'Hanken Grotesk',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.5,
                                color: const Color(0xFF404846),
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.calendar_today, size: 16, color: Color(0xFF002620)),
                                SizedBox(width: 8.w),
                                Text(
                                  DateFormat('MMMM d, yyyy').format(task.dueDate),
                                  style: TextStyle(
                                    fontFamily: 'Hanken Grotesk',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF002620),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: const Divider(color: Color(0x4DC0C8C5)),
                        ),
                        // Project
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'PROJECT',
                              style: TextStyle(
                                fontFamily: 'Hanken Grotesk',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.5,
                                color: const Color(0xFF404846),
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.folder_open, size: 16, color: Color(0xFF002620)),
                                SizedBox(width: 8.w),
                                Text(
                                  task.project,
                                  style: TextStyle(
                                    fontFamily: 'Hanken Grotesk',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF002620),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: const Divider(color: Color(0x4DC0C8C5)),
                        ),
                        // AI Prediction
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'AI INTELLIGENCE',
                              style: TextStyle(
                                fontFamily: 'Hanken Grotesk',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.5,
                                color: const Color(0xFF404846),
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Container(
                              padding: EdgeInsets.all(16.w),
                              decoration: BoxDecoration(
                                color: const Color(0xFFB6EADD).withOpacity(0.2),
                                border: Border.all(color: const Color(0xFF35675D).withOpacity(0.1)),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.bolt, color: Color(0xFF002620), size: 14),
                                      SizedBox(width: 4.w),
                                      Text(
                                        'COMPLETION PREDICTION',
                                        style: TextStyle(
                                          fontFamily: 'Hanken Grotesk',
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF002620),
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12.h),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 8.h,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFE2E3E1),
                                            borderRadius: BorderRadius.circular(4.r),
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 85,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xFF002620),
                                                    borderRadius: BorderRadius.circular(4.r),
                                                  ),
                                                ),
                                              ),
                                              Expanded(flex: 15, child: Container()),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 12.w),
                                      Text(
                                        '85% Likely',
                                        style: TextStyle(
                                          fontFamily: 'Hanken Grotesk',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF002620),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    'AI predicts this task will be completed 1 day ahead of schedule based on current velocity.',
                                    style: TextStyle(
                                      fontFamily: 'Hanken Grotesk',
                                      fontSize: 11.sp,
                                      color: const Color(0xFF404846),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24.h),
                        SizedBox(
                          width: double.infinity,
                          height: 56.h,
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<TaskBloc>().add(ToggleTaskStatusEvent(task.id));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF0D3D35),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28.r),
                              ),
                            ),
                            child: Text(
                              task.status == 'Completed' ? 'Mark Incomplete' : 'Complete Task',
                              style: TextStyle(
                                fontFamily: 'Hanken Grotesk',
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 100.h),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
