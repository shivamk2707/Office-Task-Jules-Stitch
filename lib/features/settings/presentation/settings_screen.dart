import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/auth_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F7),
      appBar: AppBar(
        title: Text(
          'Settings',
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
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          children: [
            ListTile(
              leading: const Icon(Icons.person_outline, color: Color(0xFF404846)),
              title: Text('Account Profile', style: TextStyle(fontFamily: 'Hanken Grotesk', fontSize: 16.sp, color: const Color(0xFF1A1C1B))),
              trailing: const Icon(Icons.chevron_right, color: Color(0xFF404846)),
              onTap: () {
                context.push('/profile-edit');
              },
            ),
            ListTile(
              leading: const Icon(Icons.color_lens_outlined, color: Color(0xFF404846)),
              title: Text('Theme', style: TextStyle(fontFamily: 'Hanken Grotesk', fontSize: 16.sp, color: const Color(0xFF1A1C1B))),
              trailing: const Icon(Icons.chevron_right, color: Color(0xFF404846)),
              onTap: () {
                context.push('/theme-switch');
              },
            ),
            ListTile(
              leading: const Icon(Icons.language_outlined, color: Color(0xFF404846)),
              title: Text('Language', style: TextStyle(fontFamily: 'Hanken Grotesk', fontSize: 16.sp, color: const Color(0xFF1A1C1B))),
              trailing: const Icon(Icons.chevron_right, color: Color(0xFF404846)),
              onTap: () {
                context.push('/language');
              },
            ),
            const Divider(color: Color(0xFFE2E3E1)),
            ListTile(
              leading: const Icon(Icons.logout, color: Color(0xFFBA1A1A)),
              title: Text('Log Out', style: TextStyle(fontFamily: 'Hanken Grotesk', fontSize: 16.sp, color: const Color(0xFFBA1A1A))),
              onTap: () {
                context.read<AuthBloc>().add(SignOutEvent());
                context.go('/welcome');
              },
            ),
          ],
        ),
      ),
    );
  }
}
