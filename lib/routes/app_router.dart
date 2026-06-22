import "package:go_router/go_router.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";


// Authentication
import 'package:office_task_jules_stitch/features/authentication/presentation/sign_in_screen.dart';
import 'package:office_task_jules_stitch/features/authentication/presentation/sign_up_screen.dart';
import 'package:office_task_jules_stitch/features/authentication/presentation/forgot_password_screen.dart';
import 'package:office_task_jules_stitch/features/authentication/presentation/otp_screen.dart';
import 'package:office_task_jules_stitch/features/authentication/presentation/verification_screen.dart';

// Onboarding & Setup
import 'package:office_task_jules_stitch/features/onboarding/presentation/welcome_screen.dart';
import 'package:office_task_jules_stitch/features/settings/presentation/setup_workspace_screen.dart';
import 'package:office_task_jules_stitch/features/settings/presentation/workspace_management_screen.dart';

// AI Flow
import 'package:office_task_jules_stitch/features/ai/presentation/personalize_flow_screen.dart';
import 'package:office_task_jules_stitch/features/ai/presentation/personalize_role_screen.dart';
import 'package:office_task_jules_stitch/features/ai/presentation/personalize_style_screen.dart';
import 'package:office_task_jules_stitch/features/ai/presentation/personalize_integrations_screen.dart';
import 'package:office_task_jules_stitch/features/ai/presentation/personalize_final_screen.dart';

// Main Navigation
import 'package:office_task_jules_stitch/features/home/presentation/home_dashboard_screen.dart';
import 'package:office_task_jules_stitch/features/tasks/presentation/task_creation_screen.dart';
import 'package:office_task_jules_stitch/features/tasks/presentation/task_editing_screen.dart';
import 'package:office_task_jules_stitch/features/tasks/presentation/categories_screen.dart';
import 'package:office_task_jules_stitch/features/calendar/presentation/calendar_screen.dart';
import 'package:office_task_jules_stitch/features/focus/presentation/focus_timer_screen.dart';
import 'package:office_task_jules_stitch/features/focus/presentation/pomodoro_screen.dart';
import 'package:office_task_jules_stitch/features/ai/presentation/ai_assistant_ui_screen.dart';
import 'package:office_task_jules_stitch/features/ai/presentation/chat_ui_screen.dart';

// Profile & Settings
import 'package:office_task_jules_stitch/features/profile/presentation/profile_editing_screen.dart';
import 'package:office_task_jules_stitch/features/settings/presentation/settings_screen.dart';
import 'package:office_task_jules_stitch/features/settings/presentation/theme_switching_screen.dart';
import 'package:office_task_jules_stitch/features/settings/presentation/language_selection_screen.dart';

// Analytics
import 'package:office_task_jules_stitch/features/analytics/presentation/statistics_screen.dart';
import 'package:office_task_jules_stitch/features/analytics/presentation/productivity_dashboard_screen.dart';
import 'package:office_task_jules_stitch/features/analytics/presentation/reports_screen.dart';

// New Features (Tasks & Projects)
import 'package:office_task_jules_stitch/features/tasks/presentation/task_details_screen.dart';
import 'package:office_task_jules_stitch/features/tasks/presentation/all_projects_screen.dart';
import 'package:office_task_jules_stitch/features/tasks/presentation/empty_projects_screen.dart';
import 'package:office_task_jules_stitch/features/tasks/presentation/create_project_screen.dart';

// Search
import 'package:office_task_jules_stitch/features/search/presentation/global_search_screen.dart';
import 'package:office_task_jules_stitch/features/search/presentation/search_results_screen.dart';
import 'package:office_task_jules_stitch/features/search/presentation/advanced_filters_screen.dart';

// Team & Notifications
import 'package:office_task_jules_stitch/features/team/presentation/team_activity_screen.dart';
import 'package:office_task_jules_stitch/features/team/presentation/team_pulse_screen.dart';
import 'package:office_task_jules_stitch/features/notifications/presentation/notification_center_screen.dart';

// Additional AI
import 'package:office_task_jules_stitch/features/ai/presentation/knowledge_base_screen.dart';
import 'package:office_task_jules_stitch/features/ai/presentation/export_handover_screen.dart';
import 'package:office_task_jules_stitch/features/ai/presentation/project_chat_screen.dart';

// Analytics & Assets
import 'package:office_task_jules_stitch/features/analytics/presentation/deep_work_analytics_screen.dart';
import 'package:office_task_jules_stitch/features/assets/presentation/files_assets_screen.dart';

// Premium & Misc
import 'package:office_task_jules_stitch/features/premium/presentation/upgrade_pro_screen.dart';
import 'package:office_task_jules_stitch/features/premium/presentation/payment_success_screen.dart';
import 'package:office_task_jules_stitch/core/widgets/error_404_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/welcome',
    errorBuilder: (context, state) => const Error404Screen(),
    routes: [
      // Authentication
      GoRoute(path: '/signin', builder: (context, state) => const SignInScreen()),
      GoRoute(path: '/signup', builder: (context, state) => const SignUpScreen()),
      GoRoute(path: '/forgot-password', builder: (context, state) => const ForgotPasswordScreen()),
      GoRoute(path: '/otp', builder: (context, state) => const OtpScreen()),
      GoRoute(path: '/verification-success', builder: (context, state) => const VerificationScreen()),

      // Onboarding & Setup
      GoRoute(path: '/welcome', builder: (context, state) => const WelcomeScreen()),
      GoRoute(path: '/setup-workspace', builder: (context, state) => const SetupWorkspaceScreen()),
      GoRoute(path: '/workspace-management', builder: (context, state) => const WorkspaceManagementScreen()),

      // AI Personalization Flow
      GoRoute(path: '/personalize-ai-flow', builder: (context, state) => const PersonalizeFlowScreen()),
      GoRoute(path: '/personalize-ai-role', builder: (context, state) => const PersonalizeRoleScreen()),
      GoRoute(path: '/personalize-ai-style', builder: (context, state) => const PersonalizeStyleScreen()),
      GoRoute(path: '/personalize-ai-integrations', builder: (context, state) => const PersonalizeIntegrationsScreen()),
      GoRoute(path: '/personalize-ai-final', builder: (context, state) => const PersonalizeFinalScreen()),

      // Main Navigation
      GoRoute(path: '/dashboard', builder: (context, state) => const HomeDashboardScreen()),

      // Tasks
      GoRoute(path: '/task-create', builder: (context, state) => const TaskCreationScreen()),
      GoRoute(path: '/task-edit', builder: (context, state) => const TaskEditingScreen()),
      GoRoute(path: '/categories', builder: (context, state) => const CategoriesScreen()),
      GoRoute(path: '/task-details', builder: (context, state) => const TaskDetailsScreen()),
      GoRoute(path: '/all-projects', builder: (context, state) => const AllProjectsScreen()),
      GoRoute(path: '/empty-projects', builder: (context, state) => const EmptyProjectsScreen()),
      GoRoute(path: '/create-project', builder: (context, state) => const CreateProjectScreen()),

      // Calendar & Focus
      GoRoute(path: '/calendar', builder: (context, state) => const CalendarScreen()),
      GoRoute(path: '/focus-timer', builder: (context, state) => const FocusTimerScreen()),
      GoRoute(path: '/pomodoro', builder: (context, state) => const PomodoroScreen()),

      // AI
      GoRoute(path: '/ai-assistant', builder: (context, state) => const AiAssistantUiScreen()),
      GoRoute(path: '/chat', builder: (context, state) => const ChatUiScreen()),
      GoRoute(path: '/knowledge-base', builder: (context, state) => const KnowledgeBaseScreen()),
      GoRoute(path: '/export-handover', builder: (context, state) => const ExportHandoverScreen()),
      GoRoute(path: '/project-chat', builder: (context, state) => const ProjectChatScreen()),

      // Profile & Settings
      GoRoute(path: '/profile-edit', builder: (context, state) => const ProfileEditingScreen()),
      GoRoute(path: '/settings', builder: (context, state) => const SettingsScreen()),
      GoRoute(path: '/theme-switch', builder: (context, state) => const ThemeSwitchingScreen()),
      GoRoute(path: '/language', builder: (context, state) => const LanguageSelectionScreen()),

      // Analytics & Assets
      GoRoute(path: '/statistics', builder: (context, state) => const StatisticsScreen()),
      GoRoute(path: '/productivity', builder: (context, state) => const ProductivityDashboardScreen()),
      GoRoute(path: '/reports', builder: (context, state) => const ReportsScreen()),
      GoRoute(path: '/deep-work', builder: (context, state) => const DeepWorkAnalyticsScreen()),
      GoRoute(path: '/files-assets', builder: (context, state) => const FilesAssetsScreen()),

      // Search
      GoRoute(path: '/global-search', builder: (context, state) => const GlobalSearchScreen()),
      GoRoute(path: '/search-results', builder: (context, state) => const SearchResultsScreen()),
      GoRoute(path: '/advanced-filters', builder: (context, state) => const AdvancedFiltersScreen()),

      // Team & Notifications
      GoRoute(path: '/team-activity', builder: (context, state) => const TeamActivityScreen()),
      GoRoute(path: '/team-pulse', builder: (context, state) => const TeamPulseScreen()),
      GoRoute(path: '/notification-center', builder: (context, state) => const NotificationCenterScreen()),

      // Premium
      GoRoute(path: '/upgrade-pro', builder: (context, state) => const UpgradeProScreen()),
      GoRoute(path: '/payment-success', builder: (context, state) => const PaymentSuccessScreen()),
    ],
  );
}
