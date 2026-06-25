import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../blocs/task_bloc.dart';
import '../../../models/task_model.dart';

class TaskCreationScreen extends StatefulWidget {
  const TaskCreationScreen({super.key});

  @override
  State<TaskCreationScreen> createState() => _TaskCreationScreenState();
}

class _TaskCreationScreenState extends State<TaskCreationScreen> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  String _priority = 'Medium';
  String _project = 'Personal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F7),
      appBar: AppBar(
        title: Text(
          'Create Task',
          style: TextStyle(
            fontFamily: 'Hanken Grotesk',
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF002620),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF002620)),
          onPressed: () => context.pop(),
        ),
        backgroundColor: const Color(0xFFF9F9F7),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Task Title',
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF404846),
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: 'E.g. Prepare Q3 Report',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(color: const Color(0xFFC0C8C5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(color: const Color(0xFF002620), width: 2),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                'Description',
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF404846),
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: _descController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Add details...',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(color: const Color(0xFFC0C8C5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(color: const Color(0xFF002620), width: 2),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                'Priority',
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF404846),
                ),
              ),
              SizedBox(height: 8.h),
              SegmentedButton<String>(
                segments: const [
                  ButtonSegment(value: 'Low', label: Text('Low')),
                  ButtonSegment(value: 'Medium', label: Text('Medium')),
                  ButtonSegment(value: 'High', label: Text('High')),
                ],
                selected: {_priority},
                onSelectionChanged: (Set<String> newSelection) {
                  setState(() {
                    _priority = newSelection.first;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                    if (states.contains(WidgetState.selected)) {
                      return const Color(0xFF0D3D35);
                    }
                    return Colors.white;
                  }),
                  foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                    if (states.contains(WidgetState.selected)) {
                      return Colors.white;
                    }
                    return const Color(0xFF1A1C1B);
                  }),
                ),
              ),
              SizedBox(height: 48.h),
              SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: () {
                    if (_titleController.text.isNotEmpty) {
                      final newTask = Task(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        title: _titleController.text,
                        description: _descController.text,
                        dueDate: DateTime.now().add(const Duration(days: 1)),
                        priority: _priority,
                        status: 'Pending',
                        project: _project,
                      );
                      context.read<TaskBloc>().add(AddTaskEvent(newTask));
                      context.pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0D3D35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: Text(
                    'Create Task',
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
      ),
    );
  }
}
