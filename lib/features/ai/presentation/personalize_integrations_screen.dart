import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import "package:go_router/go_router.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter/material.dart';

class PersonalizeIntegrationsScreen extends StatelessWidget {
  const PersonalizeIntegrationsScreen({super.key});

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
                'Connect Integrations',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 8.h),
              Text(
                'Connect your favorite tools for a seamless experience.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              SizedBox(height: 32.h),
              _buildIntegrationCard(context, 'Google Calendar', Icons.calendar_today, true),
              SizedBox(height: 16.h),
              _buildIntegrationCard(context, 'Slack', Icons.chat, false),
              SizedBox(height: 16.h),
              _buildIntegrationCard(context, 'GitHub', Icons.code, true),
              SizedBox(height: 32.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.push('/personalize-ai-final');
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

  Widget _buildIntegrationCard(BuildContext context, String title, IconData icon, bool isConnected) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: isConnected ? Theme.of(context).colorScheme.surfaceContainerLowest : Theme.of(context).colorScheme.primary,
          foregroundColor: isConnected ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onPrimary,
          side: isConnected ? BorderSide(color: Theme.of(context).colorScheme.primary) : null,
        ),
        child: Text(isConnected ? 'Connected' : 'Connect'),
      ),
    );
  }
}
