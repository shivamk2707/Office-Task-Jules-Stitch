import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Placeholder for an actual calendar widget (e.g., table_calendar)
            Container(
              padding: EdgeInsets.all(24.w),
              color: Theme.of(context).colorScheme.surfaceContainerLowest,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('October 2026', style: Theme.of(context).textTheme.headlineSmall),
                      Row(
                        children: [
                          IconButton(icon: const Icon(Icons.chevron_left), onPressed: () {}),
                          IconButton(icon: const Icon(Icons.chevron_right), onPressed: () {}),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  const Center(child: Text('Calendar Grid Placeholder')),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(24.w),
                children: [
                  Text('Agenda', style: Theme.of(context).textTheme.headlineSmall),
                  SizedBox(height: 16.h),
                  // Placeholder for agenda items
                  const ListTile(
                    title: Text('Design Review'),
                    subtitle: Text('10:00 AM - 11:30 AM'),
                    leading: Icon(Icons.event),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
