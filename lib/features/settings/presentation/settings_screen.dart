import 'package:go_router/go_router.dart';
import "package:go_router/go_router.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Account Profile'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                context.push('/profile-edit');
              },
            ),
            ListTile(
              leading: const Icon(Icons.color_lens),
              title: const Text('Theme'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                context.push('/theme-switch');
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Language'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                context.push('/language');
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.logout,
                  color: Theme.of(context).colorScheme.error),
              title: Text('Log Out',
                  style: TextStyle(color: Theme.of(context).colorScheme.error)),
              onTap: () {
                context.go('/signin');
              },
            ),
          ],
        ),
      ),
    );
  }
}
