mkdir -p lib/core/widgets
mkdir -p lib/features/tasks/presentation
mkdir -p lib/features/analytics/presentation
mkdir -p lib/features/assets/presentation
mkdir -p lib/features/search/presentation
mkdir -p lib/features/team/presentation
mkdir -p lib/features/notifications/presentation
mkdir -p lib/features/premium/presentation

create_screen() {
  local filepath=$1
  local classname=$2
  local title=$3

  cat << INNER_EOF > "$filepath"
import 'package:flutter/material.dart';

class $classname extends StatelessWidget {
  const $classname({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('$title')),
      body: const Center(child: Text('$title Screen')),
    );
  }
}
INNER_EOF
}

create_screen "lib/core/widgets/error_404_screen.dart" "Error404Screen" "404 Not Found"
create_screen "lib/features/tasks/presentation/create_project_screen.dart" "CreateProjectScreen" "Create Project"
create_screen "lib/features/analytics/presentation/statistics_screen.dart" "StatisticsScreen" "Statistics"
create_screen "lib/features/analytics/presentation/productivity_dashboard_screen.dart" "ProductivityDashboardScreen" "Productivity Dashboard"
create_screen "lib/features/analytics/presentation/reports_screen.dart" "ReportsScreen" "Reports"
create_screen "lib/features/analytics/presentation/deep_work_analytics_screen.dart" "DeepWorkAnalyticsScreen" "Deep Work Analytics"
create_screen "lib/features/assets/presentation/files_assets_screen.dart" "FilesAssetsScreen" "Files & Assets"
create_screen "lib/features/search/presentation/global_search_screen.dart" "GlobalSearchScreen" "Global Search"
create_screen "lib/features/search/presentation/search_results_screen.dart" "SearchResultsScreen" "Search Results"
create_screen "lib/features/search/presentation/advanced_filters_screen.dart" "AdvancedFiltersScreen" "Advanced Filters"
create_screen "lib/features/team/presentation/team_activity_screen.dart" "TeamActivityScreen" "Team Activity"
create_screen "lib/features/team/presentation/team_pulse_screen.dart" "TeamPulseScreen" "Team Pulse"
create_screen "lib/features/notifications/presentation/notification_center_screen.dart" "NotificationCenterScreen" "Notifications"
create_screen "lib/features/ai/presentation/knowledge_base_screen.dart" "KnowledgeBaseScreen" "Knowledge Base"
create_screen "lib/features/ai/presentation/export_handover_screen.dart" "ExportHandoverScreen" "Export & Handover"
create_screen "lib/features/ai/presentation/project_chat_screen.dart" "ProjectChatScreen" "Project Chat"
create_screen "lib/features/premium/presentation/upgrade_pro_screen.dart" "UpgradeProScreen" "Upgrade to Pro"
create_screen "lib/features/premium/presentation/payment_success_screen.dart" "PaymentSuccessScreen" "Payment Success"
