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

class AllProjectsScreen extends StatefulWidget {
  const AllProjectsScreen({super.key});

  @override
  State<AllProjectsScreen> createState() => _AllProjectsScreenState();
}

class _AllProjectsScreenState extends State<AllProjectsScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AiColors.surfaceBright,
      appBar: AppBar(
        backgroundColor: AiColors.surfaceBright.withOpacity(0.9),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AiColors.onSurfaceVariant),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune, color: AiColors.onSurfaceVariant),
            onPressed: () {},
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: CircleAvatar(
              radius: 16.r,
              backgroundColor: AiColors.surfaceContainerHigh,
              backgroundImage: const NetworkImage('https://i.pravatar.cc/150?u=a042581f4e29026704d'),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isDesktop = constraints.maxWidth > 800;
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: isDesktop
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 8,
                        child: _buildMainContent(),
                      ),
                      SizedBox(width: 24.w),
                      Expanded(
                        flex: 4,
                        child: _buildAiSidebar(),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildMainContent(),
                      SizedBox(height: 32.h),
                      _buildAiSidebar(),
                      SizedBox(height: 32.h),
                    ],
                  ),
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go('/create-project'),
        backgroundColor: AiColors.primary,
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(
          'New Project',
          style: TextStyle(
            fontFamily: 'Hanken Grotesk',
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'All Projects',
          style: TextStyle(
            fontFamily: 'Hanken Grotesk',
            fontSize: 28.sp,
            fontWeight: FontWeight.w700,
            color: AiColors.primary,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          'Managing 12 active workflows for your team',
          style: TextStyle(
            fontFamily: 'Hanken Grotesk',
            fontSize: 14.sp,
            color: AiColors.onSurfaceVariant,
          ),
        ),
        SizedBox(height: 24.h),

        // Search Bar
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: AiColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(color: AiColors.outlineVariant.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              Icon(Icons.search, color: AiColors.outlineVariant),
              SizedBox(width: 8.w),
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search projects...',
                    hintStyle: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 14.sp,
                      color: AiColors.outlineVariant,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 32.h),

        // Projects List
        _buildProjectCard(
          title: 'Credivance',
          status: 'On Progress',
          description: 'Financial dashboard redesign focusing on seamless user onboarding and real-time transaction tracking for enterprise clients.',
          progress: 65,
          updatedText: 'Updated 2h ago',
          avatars: ['https://i.pravatar.cc/150?u=1', 'https://i.pravatar.cc/150?u=2', 'https://i.pravatar.cc/150?u=3'],
          extraCount: 2,
        ),
        SizedBox(height: 16.h),
        _buildProjectCard(
          title: 'Xpand',
          status: 'On Progress',
          description: 'Market expansion strategy for the APAC region, including localized marketing assets and compliance infrastructure.',
          progress: 32,
          updatedText: 'Updated 5h ago',
          avatars: ['https://i.pravatar.cc/150?u=4', 'https://i.pravatar.cc/150?u=5'],
          extraCount: 1,
        ),
        SizedBox(height: 16.h),
        _buildProjectCard(
          title: 'YudsCo',
          status: 'On Progress',
          description: 'Implementation of AI-driven customer support bots and knowledge base automation for e-commerce logistics.',
          progress: 89,
          updatedText: 'Updated 12m ago',
          avatars: ['https://i.pravatar.cc/150?u=6'],
        ),
      ],
    );
  }

  Widget _buildProjectCard({
    required String title,
    required String status,
    required String description,
    required int progress,
    required String updatedText,
    required List<String> avatars,
    int? extraCount,
  }) {
    return Container(
      padding: EdgeInsets.all(24.w),
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
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AiColors.onSurface,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: AiColors.secondaryContainer.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        fontFamily: 'Hanken Grotesk',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: AiColors.secondary,
                      ),
                    ),
                  ),
                ],
              ),
              Icon(Icons.more_vert, color: AiColors.outlineVariant),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            description,
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 14.sp,
              color: AiColors.onSurfaceVariant,
              height: 1.5,
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PROGRESS',
                      style: TextStyle(
                        fontFamily: 'Hanken Grotesk',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                        color: AiColors.outlineVariant,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4.r),
                            child: LinearProgressIndicator(
                              value: progress / 100,
                              minHeight: 8.h,
                              backgroundColor: AiColors.surfaceContainerHigh,
                              valueColor: const AlwaysStoppedAnimation<Color>(AiColors.primary),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          '$progress%',
                          style: TextStyle(
                            fontFamily: 'Hanken Grotesk',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: AiColors.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  for (int i = 0; i < avatars.length; i++)
                    Transform.translate(
                      offset: Offset(i * -8.w, 0),
                      child: CircleAvatar(
                        radius: 12.r,
                        backgroundImage: NetworkImage(avatars[i]),
                      ),
                    ),
                  if (extraCount != null)
                    Transform.translate(
                      offset: Offset(avatars.length * -8.w, 0),
                      child: CircleAvatar(
                        radius: 12.r,
                        backgroundColor: AiColors.surfaceContainerHigh,
                        child: Text(
                          '+$extraCount',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: AiColors.onSurfaceVariant,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.schedule, size: 14.sp, color: AiColors.outlineVariant),
                  SizedBox(width: 4.w),
                  Text(
                    updatedText,
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 12.sp,
                      color: AiColors.outlineVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAiSidebar() {
    return Column(
      children: [
        _buildAiInsightsCard(),
      ],
    );
  }

  Widget _buildAiInsightsCard() {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AiColors.primaryContainer,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x260D3D35),
            blurRadius: 20,
            offset: Offset(0, 10),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.bolt, color: AiColors.secondaryFixed, size: 20.sp),
              SizedBox(width: 8.w),
              Text(
                'AI Insights',
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            'You have 3 projects nearing deadlines this week.',
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 14.sp,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            "Based on current velocity, Credivance might need more resources to meet Friday's milestone. Would you like me to draft a resource reallocation plan?",
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 14.sp,
              color: Colors.white.withOpacity(0.7),
              height: 1.5,
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AiColors.secondaryFixed,
                  foregroundColor: AiColors.primaryContainer,
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Review Plan',
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
                  foregroundColor: Colors.white,
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
          SizedBox(height: 24.h),
          Divider(color: Colors.white.withOpacity(0.2)),
          SizedBox(height: 16.h),
          Text(
            'PRIORITY RISK',
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 10.sp,
              fontWeight: FontWeight.w700,
              color: AiColors.secondaryFixed,
              letterSpacing: 0.6,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  'X',
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Xpand',
                      style: TextStyle(
                        fontFamily: 'Hanken Grotesk',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Localized assets pending approval from regional leads.',
                      style: TextStyle(
                        fontFamily: 'Hanken Grotesk',
                        fontSize: 12.sp,
                        color: Colors.white.withOpacity(0.7),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
