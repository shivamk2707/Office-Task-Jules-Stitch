import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import "package:go_router/go_router.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter/material.dart';

class WorkspaceManagementScreen extends StatelessWidget {
  const WorkspaceManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Workspace Management'),
      ),
      body: ListView(
        padding: EdgeInsets.all(24.w),
        children: [
          const ListTile(
            leading: Icon(Icons.business),
            title: Text('Acme Corp Design Team'),
            subtitle: Text('Current Workspace'),
            trailing: Icon(Icons.check, color: Colors.green),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Create New Workspace'),
            onTap: () {
              context.push('/setup-workspace');
            },
          ),
        ],
      ),
    );
  }
}
