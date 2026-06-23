import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/app_theme.dart';
import 'routes/app_router.dart';
import 'blocs/auth_bloc.dart';
import 'blocs/task_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const LuminaApp());
}

class LuminaApp extends StatelessWidget {
  const LuminaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc()..add(CheckAuthEvent()),
        ),
        BlocProvider<TaskBloc>(
          create: (context) => TaskBloc()..add(LoadTasksEvent()),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            title: 'Lumina AI Productivity App',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            themeMode: ThemeMode.system,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
