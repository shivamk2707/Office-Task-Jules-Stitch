import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PersonalizeRoleScreen extends StatefulWidget {
  const PersonalizeRoleScreen({super.key});

  @override
  State<PersonalizeRoleScreen> createState() => _PersonalizeRoleScreenState();
}

class _PersonalizeRoleScreenState extends State<PersonalizeRoleScreen> {
  String _selectedRole = 'Software Engineer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.h),
              Text(
                'Select Your Role',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 8.h),
              Text(
                'This helps us configure default suggestions.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              SizedBox(height: 32.h),
              _buildRoleCard(context, 'Software Engineer', Icons.code),
              SizedBox(height: 16.h),
              _buildRoleCard(context, 'Product Manager', Icons.business_center),
              SizedBox(height: 16.h),
              _buildRoleCard(context, 'Designer', Icons.brush),
              SizedBox(height: 32.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.push('/personalize-ai-style');
                  },
                  child: const Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard(BuildContext context, String title, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: RadioListTile<String>(
        value: title,
        groupValue: _selectedRole,
        onChanged: (value) {
          if (value != null) {
            setState(() {
              _selectedRole = value;
            });
          }
        },
        title: Text(title),
        secondary: Icon(icon),
      ),
    );
  }
}
