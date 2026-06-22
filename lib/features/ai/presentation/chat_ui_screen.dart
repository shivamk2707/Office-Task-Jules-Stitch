import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import "package:go_router/go_router.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter/material.dart';

class ChatUiScreen extends StatelessWidget {
  const ChatUiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('AI Chat'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(24.w),
                children: [
                  _buildMessage(context,
                      'Hello! I am your AI assistant. How can I help you organize your tasks today?',
                      isAi: true),
                  SizedBox(height: 16.h),
                  _buildMessage(context,
                      'Can you show me what I have planned for tomorrow?',
                      isAi: false),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerLowest,
                border: Border(
                  top: BorderSide(
                      color: Theme.of(context).colorScheme.outlineVariant),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 12.h),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9999),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor:
                            Theme.of(context).colorScheme.surfaceContainer,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  IconButton(
                    icon: const Icon(Icons.send),
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage(BuildContext context, String text,
      {required bool isAi}) {
    return Align(
      alignment: isAi ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isAi
              ? Theme.of(context).colorScheme.secondaryContainer
              : Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(16.r).copyWith(
            bottomLeft: isAi ? const Radius.circular(0) : null,
            bottomRight: !isAi ? const Radius.circular(0) : null,
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: isAi
                    ? Theme.of(context).colorScheme.onSecondaryContainer
                    : Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      ),
    );
  }
}
