import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/Theme/Teme_data.dart';
import 'package:post_bet/core/utils/app_router.dart';
import 'package:post_bet/features/settings/presentation/manager/settings_cubit/cubit/settings_cubit.dart';
import 'package:post_bet/generated/l10n.dart';

class PostBetApp extends StatelessWidget {
  const PostBetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => SettingsCubit()..initializeLanguage()),
        ],
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return MaterialApp.router(
                locale: isEnglish ? const Locale('en') : const Locale('ar'),
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                debugShowCheckedModeBanner: false,
                routerConfig: AppRouter.router,
                theme: isDark ? AppTheme.darkTheme : AppTheme.lightTheme);
          },
        ),
      ),
    );
  }
}
