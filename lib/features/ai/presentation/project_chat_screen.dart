import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AiColors {
  static const Color primary = Color(0xFF002620);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color outlineVariant = Color(0xFFC0C8C5);
  static const Color onSurface = Color(0xFF1A1C1B);
  static const Color onSurfaceVariant = Color(0xFF404846);
  static const Color surfaceBright = Color(0xFFF9F9F7);
  static const Color primaryContainer = Color(0xFF0D3D35);
  static const Color secondary = Color(0xFF35675D);
  static const Color secondaryContainer = Color(0xFFB6EADD);
  static const Color onSecondaryContainer = Color(0xFF3A6B61);
  static const Color surfaceContainerHigh = Color(0xFFE8E8E6);
  static const Color secondaryFixed = Color(0xFFB9EDE0);
}

class ProjectChatScreen extends StatelessWidget {
  const ProjectChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AiColors.surfaceBright,
      appBar: AppBar(
        backgroundColor: AiColors.surfaceBright.withOpacity(0.9),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AiColors.onSurface),
          onPressed: () => context.pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Design System Revamp',
              style: TextStyle(
                fontFamily: 'Hanken Grotesk',
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AiColors.onSurface,
              ),
            ),
            Text(
              '4 Members • 2 Online',
              style: TextStyle(
                fontFamily: 'Hanken Grotesk',
                fontSize: 12.sp,
                color: AiColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: AiColors.onSurface),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildContextPanel(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16.w),
                children: [
                  _buildDateDivider('Today'),
                  _buildMessage(
                    sender: 'Sarah',
                    time: '10:24 AM',
                    message: "Has anyone had a chance to review the new design tokens for the mobile view? I think we might need to adjust the primary container's saturation for better accessibility.",
                    isMe: false,
                    avatarUrl: 'https://i.pravatar.cc/150?u=sarah',
                  ),
                  SizedBox(height: 16.h),
                  _buildMessage(
                    sender: 'Me',
                    time: '10:26 AM',
                    message: "I'm looking at them now. You're right, the contrast on the active tabs feels a bit soft in low light. Let's push the forest green a bit darker.",
                    isMe: true,
                  ),
                  SizedBox(height: 16.h),
                  _buildAiSuggestion(),
                  SizedBox(height: 16.h),
                  _buildMessage(
                    sender: 'Mark',
                    time: '10:30 AM',
                    message: "Great catch! Here is the latest render with the adjusted tokens for comparison.",
                    isMe: false,
                    avatarUrl: 'https://i.pravatar.cc/150?u=mark',
                  ),
                ],
              ),
            ),
            _buildInputArea(),
          ],
        ),
      ),
    );
  }

  Widget _buildContextPanel() {
    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AiColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AiColors.outlineVariant.withOpacity(0.3)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x050D3D35),
            blurRadius: 10,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Project Context',
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AiColors.onSurfaceVariant,
                ),
              ),
              Icon(Icons.keyboard_arrow_up, color: AiColors.onSurfaceVariant, size: 20.sp),
            ],
          ),
          SizedBox(height: 12.h),
          _buildContextItem(Icons.picture_as_pdf, 'Q4 Strategy Deck.pdf', 'Shared by Sarah • 2h ago'),
          SizedBox(height: 8.h),
          _buildContextItem(Icons.link, 'Branding Guidelines v2', 'Figma Link • Yesterday'),
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AiColors.secondaryContainer.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.bolt, color: AiColors.secondary, size: 16.sp),
                    SizedBox(width: 4.w),
                    Text(
                      'AI Insights',
                      style: TextStyle(
                        fontFamily: 'Hanken Grotesk',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: AiColors.secondary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  'Most discussions today are focused on the "Hero Section" interaction. I can draft a spec for the devs if you\'re ready.',
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 12.sp,
                    color: AiColors.onSurfaceVariant,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Generate Spec',
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AiColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContextItem(IconData icon, String title, String subtitle) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: AiColors.surfaceBright,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(icon, size: 16.sp, color: AiColors.onSurfaceVariant),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AiColors.onSurface,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 12.sp,
                  color: AiColors.outlineVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDateDivider(String date) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: AiColors.surfaceContainerHigh.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Text(
            date,
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 12.sp,
              color: AiColors.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMessage({
    required String sender,
    required String time,
    required String message,
    required bool isMe,
    String? avatarUrl,
  }) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (!isMe && avatarUrl != null) ...[
          CircleAvatar(
            radius: 16.r,
            backgroundImage: NetworkImage(avatarUrl),
          ),
          SizedBox(width: 8.w),
        ],
        Flexible(
          child: Column(
            crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              if (!isMe)
                Padding(
                  padding: EdgeInsets.only(left: 4.w, bottom: 4.h),
                  child: Text(
                    '$sender • $time',
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 12.sp,
                      color: AiColors.onSurfaceVariant,
                    ),
                  ),
                ),
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: isMe ? AiColors.primaryContainer : AiColors.surfaceContainerLowest,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                    bottomLeft: isMe ? Radius.circular(16.r) : Radius.zero,
                    bottomRight: isMe ? Radius.zero : Radius.circular(16.r),
                  ),
                  border: isMe ? null : Border.all(color: AiColors.outlineVariant.withOpacity(0.3)),
                ),
                child: Text(
                  message,
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 14.sp,
                    color: isMe ? Colors.white : AiColors.onSurface,
                    height: 1.4,
                  ),
                ),
              ),
              if (isMe)
                Padding(
                  padding: EdgeInsets.only(right: 4.w, top: 4.h),
                  child: Text(
                    time,
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 12.sp,
                      color: AiColors.onSurfaceVariant,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAiSuggestion() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AiColors.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AiColors.primary.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.bolt, color: AiColors.secondary, size: 18.sp),
              SizedBox(width: 8.w),
              Text(
                'AI Suggested Action',
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: AiColors.secondary,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            'I can simulate the accessibility score for the proposed color shift immediately.',
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 14.sp,
              color: AiColors.onSurfaceVariant,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AiColors.primary,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  elevation: 0,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'Run Simulation',
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: AiColors.onSurfaceVariant,
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'Dismiss',
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AiColors.surfaceContainerLowest,
        border: Border(top: BorderSide(color: AiColors.outlineVariant.withOpacity(0.3))),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.add_circle_outline, color: AiColors.outlineVariant, size: 28.sp),
            onPressed: () {},
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: AiColors.surfaceBright,
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(color: AiColors.outlineVariant.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Type a message...',
                      style: TextStyle(
                        fontFamily: 'Hanken Grotesk',
                        fontSize: 14.sp,
                        color: AiColors.outlineVariant,
                      ),
                    ),
                  ),
                  Icon(Icons.sentiment_satisfied, color: AiColors.outlineVariant, size: 24.sp),
                ],
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: const BoxDecoration(
              color: AiColors.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.send, color: Colors.white, size: 20.sp),
          ),
        ],
      ),
    );
  }
}
