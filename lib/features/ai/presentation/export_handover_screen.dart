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

class ExportHandoverScreen extends StatelessWidget {
  const ExportHandoverScreen({super.key});

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
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Project Finalization',
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 34.sp,
                  fontWeight: FontWeight.w700,
                  color: AiColors.onSurface,
                  letterSpacing: -0.68,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                'Complete your project by exporting assets, generating summaries, and handing off work to your clients or team members.',
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 16.sp,
                  color: AiColors.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 32.h),

              _buildAiSummary(),
              SizedBox(height: 32.h),

              Text(
                'Final Deliverables',
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AiColors.onSurface,
                ),
              ),
              SizedBox(height: 16.h),
              _buildDeliverable(Icons.description_outlined, 'Final_Architecture_Report.pdf', '4.2 MB • Generated 2h ago', Icons.visibility_outlined),
              _buildDeliverable(Icons.palette_outlined, 'Design_System_V2_Figma', 'Live Link • Sync 10m ago', Icons.open_in_new),
              _buildDeliverable(Icons.code_outlined, 'Source_Code_Archive.zip', '128 MB • Last Commit 1d ago', Icons.download_outlined),
              SizedBox(height: 32.h),

              Text(
                'Export To',
                style: TextStyle(
                  fontFamily: 'Hanken Grotesk',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AiColors.onSurface,
                ),
              ),
              SizedBox(height: 16.h),
              _buildExportOption(Icons.picture_as_pdf_outlined, 'Export as PDF'),
              _buildExportOption(Icons.notes_outlined, 'Sync to Notion'),
              _buildExportOption(Icons.category_outlined, 'Export to Figma'),
              _buildExportOption(Icons.chat_outlined, 'Notify on Slack'),
              SizedBox(height: 32.h),

              _buildClientAccess(),
              SizedBox(height: 48.h),

              Center(
                child: Text(
                  'Your project is ready for the world.',
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 14.sp,
                    fontStyle: FontStyle.italic,
                    color: AiColors.outlineVariant,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAiSummary() {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.bolt, color: AiColors.secondaryFixed, size: 20.sp),
                  SizedBox(width: 8.w),
                  Text(
                    'AI Handover Summary',
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AiColors.secondaryContainer,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text(
                  'OPTIMIZED',
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                    color: AiColors.onSecondaryContainer,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            'Project Aurora has been completed with high efficiency. Over the last 14 days, our team successfully delivered all 24 milestones. Key highlights include the architectural redesign and the integration of the real-time data pipeline.',
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 14.sp,
              color: Colors.white.withOpacity(0.9),
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
                      'Work Hours Saved',
                      style: TextStyle(
                        fontFamily: 'Hanken Grotesk',
                        fontSize: 12.sp,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '124 hrs',
                      style: TextStyle(
                        fontFamily: 'Hanken Grotesk',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Completion Rate',
                      style: TextStyle(
                        fontFamily: 'Hanken Grotesk',
                        fontSize: 12.sp,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '100%',
                      style: TextStyle(
                        fontFamily: 'Hanken Grotesk',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Text(
            'The handover package includes detailed API documentation, high-fidelity UI kits in Figma, and a comprehensive project retrospective as a PDF.',
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 14.sp,
              color: Colors.white.withOpacity(0.9),
              height: 1.5,
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.edit_note, size: 18.sp, color: Colors.white),
                label: Text(
                  'REGENERATE SUMMARY',
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.white.withOpacity(0.3)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: AiColors.secondaryFixed,
                  ),
                  child: Text(
                    'COPY TO CLIPBOARD',
                    style: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDeliverable(IconData icon, String title, String subtitle, IconData actionIcon) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AiColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AiColors.outlineVariant.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: AiColors.surfaceBright,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(icon, size: 20.sp, color: AiColors.onSurfaceVariant),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Hanken Grotesk',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AiColors.onSurface,
                  ),
                ),
                SizedBox(height: 4.h),
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
          IconButton(
            icon: Icon(actionIcon, size: 20.sp, color: AiColors.onSurfaceVariant),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildExportOption(IconData icon, String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AiColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AiColors.outlineVariant.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20.sp, color: AiColors.onSurfaceVariant),
          SizedBox(width: 16.w),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Hanken Grotesk',
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AiColors.onSurface,
              ),
            ),
          ),
          Icon(Icons.chevron_right, size: 20.sp, color: AiColors.outlineVariant),
        ],
      ),
    );
  }

  Widget _buildClientAccess() {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AiColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AiColors.outlineVariant.withOpacity(0.3)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A0D3D35),
            blurRadius: 30,
            offset: Offset(0, 30),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Client Access',
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AiColors.onSurface,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Grant temporary access to the project portal for final sign-off.',
            style: TextStyle(
              fontFamily: 'Hanken Grotesk',
              fontSize: 14.sp,
              color: AiColors.onSurfaceVariant,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Client Email',
                    hintStyle: TextStyle(
                      fontFamily: 'Hanken Grotesk',
                      fontSize: 14.sp,
                      color: AiColors.outlineVariant,
                    ),
                    filled: true,
                    fillColor: AiColors.surfaceBright,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: AiColors.outlineVariant.withOpacity(0.5)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: AiColors.outlineVariant.withOpacity(0.5)),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AiColors.primary,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'SEND ACCESS INVITE',
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
}
