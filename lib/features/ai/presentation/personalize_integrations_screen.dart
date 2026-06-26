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

class PersonalizeIntegrationsScreen extends StatefulWidget {
  const PersonalizeIntegrationsScreen({super.key});

  @override
  State<PersonalizeIntegrationsScreen> createState() => _PersonalizeIntegrationsScreenState();
}

class _PersonalizeIntegrationsScreenState extends State<PersonalizeIntegrationsScreen> {
  final Set<String> _connectedTools = {};

  final List<Map<String, dynamic>> _tools = [
    {
      'name': 'Slack',
      'description': 'Sync channels and DM tasks.',
      'icon': Icons.chat, // Placeholder for Slack icon
    },
    {
      'name': 'Figma',
      'description': 'Track design feedback and iterations.',
      'icon': Icons.draw, // Placeholder for Figma icon
    },
    {
      'name': 'GitHub',
      'description': 'Link PRs and issues to tasks.',
      'icon': Icons.code, // Placeholder for GitHub icon
    },
    {
      'name': 'Google Drive',
      'description': 'Access and attach documents seamlessly.',
      'icon': Icons.add_to_drive, // Placeholder for Drive icon
    },
    {
      'name': 'Notion',
      'description': 'Full workspace synchronization for documentation.',
      'icon': Icons.note, // Placeholder for Notion icon
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AiColors.surfaceBright,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AiColors.onSurfaceVariant),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 540.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'STEP 4 OF 5',
                        style: TextStyle(
                          fontFamily: 'Hanken Grotesk',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AiColors.secondary,
                          letterSpacing: 0.7,
                        ),
                      ),
                      Text(
                        '80% Complete',
                        style: TextStyle(
                          fontFamily: 'Hanken Grotesk',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AiColors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Integrate Your Tools',
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 34.sp,
                      fontWeight: FontWeight.w700,
                      color: AiColors.onSurface,
                      letterSpacing: -0.68,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "Connect your existing ecosystem to let TaskFlow AI automate your cross-platform workflows and surface relevant insights.",
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 16.sp,
                      color: AiColors.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 48.h),

                  // Integrations List
                  ..._tools.map((tool) => _buildToolRow(tool)).toList(),

                  SizedBox(height: 48.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => context.go('/dashboard'),
                        style: TextButton.styleFrom(
                          foregroundColor: AiColors.onSurfaceVariant,
                        ),
                        child: Text(
                          "Maybe later",
                          style: TextStyle(
                            fontFamily: 'Hanken Grotesk',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => context.go('/personalize-ai-final'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AiColors.primaryContainer,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Continue to Final Step',
                          style: TextStyle(
                            fontFamily: 'Hanken Grotesk',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildToolRow(Map<String, dynamic> tool) {
    final bool isConnected = _connectedTools.contains(tool['name']);

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(20.w),
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
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AiColors.surfaceBright,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(tool['icon'], size: 24.sp, color: AiColors.onSurface),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tool['name'],
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AiColors.onSurface,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  tool['description'],
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 14.sp,
                    color: AiColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16.w),
          isConnected
              ? TextButton.icon(
                  onPressed: () {
                    setState(() {
                      _connectedTools.remove(tool['name']);
                    });
                  },
                  icon: Icon(Icons.check_circle, color: AiColors.primary, size: 18.sp),
                  label: Text(
                    'Connected',
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AiColors.primary,
                    ),
                  ),
                )
              : OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _connectedTools.add(tool['name']);
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AiColors.onSurface,
                    side: BorderSide(color: AiColors.outlineVariant.withOpacity(0.5)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  child: Text(
                    tool['name'] == 'Google Drive' || tool['name'] == 'Notion' ? 'Link Workspace' : 'Connect',
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
