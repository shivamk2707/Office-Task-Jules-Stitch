import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(24.w),
        children: [
          _buildSettingsTile(
            context,
            icon: Icons.person_outline,
            title: 'Edit Profile',
            onTap: () {
              context.push('/profile-edit');
            },
          ),
          const Divider(),
          _buildSettingsTile(
            context,
            icon: Icons.palette_outlined,
            title: 'Theme',
            onTap: () {
              context.push('/theme-switch');
            },
          ),
          const Divider(),
          _buildSettingsTile(
            context,
            icon: Icons.language_outlined,
            title: 'Language',
            onTap: () {
              context.push('/language');
            },
          ),
          const Divider(),
          _buildSettingsTile(
            context,
            icon: Icons.logout,
            title: 'Log Out',
            onTap: () {
              context.go('/signin');
            },
            textColor: Theme.of(context).colorScheme.error,
            iconColor: Theme.of(context).colorScheme.error,
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTile(BuildContext context, {required IconData icon, required String title, required VoidCallback onTap, Color? textColor, Color? iconColor}) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? Theme.of(context).colorScheme.onSurface),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: textColor ?? Theme.of(context).colorScheme.onSurface,
        ),
      ),
      trailing: Icon(Icons.chevron_right, color: Theme.of(context).colorScheme.outline),
      onTap: onTap,
    );
  }
}
