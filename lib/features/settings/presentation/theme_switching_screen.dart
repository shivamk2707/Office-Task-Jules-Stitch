import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ThemeSwitchingScreen extends StatefulWidget {
  const ThemeSwitchingScreen({super.key});

  @override
  State<ThemeSwitchingScreen> createState() => _ThemeSwitchingScreenState();
}

class _ThemeSwitchingScreenState extends State<ThemeSwitchingScreen> {
  String _selectedTheme = 'system';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Theme'),
      ),
      body: ListView(
        padding: EdgeInsets.all(24.w),
        children: [
          RadioListTile<String>(
            title: const Text('System Default'),
            value: 'system',
            groupValue: _selectedTheme,
            onChanged: (String? value) {
              if (value != null) setState(() => _selectedTheme = value);
            },
          ),
          RadioListTile<String>(
            title: const Text('Light'),
            value: 'light',
            groupValue: _selectedTheme,
            onChanged: (String? value) {
              if (value != null) setState(() => _selectedTheme = value);
            },
          ),
          RadioListTile<String>(
            title: const Text('Dark'),
            value: 'dark',
            groupValue: _selectedTheme,
            onChanged: (String? value) {
              if (value != null) setState(() => _selectedTheme = value);
            },
          ),
        ],
      ),
    );
  }
}
