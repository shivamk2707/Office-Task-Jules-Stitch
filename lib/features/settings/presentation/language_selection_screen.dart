import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String _selectedLang = 'en';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Language'),
      ),
      body: ListView(
        padding: EdgeInsets.all(24.w),
        children: [
          RadioListTile<String>(
            title: const Text('English (US)'),
            value: 'en',
            groupValue: _selectedLang,
            onChanged: (String? value) {
              if (value != null) setState(() => _selectedLang = value);
            },
          ),
          RadioListTile<String>(
            title: const Text('Spanish'),
            value: 'es',
            groupValue: _selectedLang,
            onChanged: (String? value) {
              if (value != null) setState(() => _selectedLang = value);
            },
          ),
          RadioListTile<String>(
            title: const Text('French'),
            value: 'fr',
            groupValue: _selectedLang,
            onChanged: (String? value) {
              if (value != null) setState(() => _selectedLang = value);
            },
          ),
        ],
      ),
    );
  }
}
