import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/Theme/Teme_data.dart';
import 'package:post_bet/core/utils/app_router.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/features/activities/data/repo/activities_repo.dart';
import 'package:post_bet/features/activities/presentation/manager/cubit/get_posts_cubit.dart';
import 'package:post_bet/features/authentication/data/repo/auth_repo.dart';
import 'package:post_bet/features/authentication/presentation/manager/login_cubit/login_cubit.dart';
import 'package:post_bet/features/home/data/photos_repo.dart';
import 'package:post_bet/features/home/data/post_repo.dart';
import 'package:post_bet/features/home/presentation/manager/add_post_cubit/cubit/add_post_cubit.dart';
import 'package:post_bet/features/home/presentation/manager/add_post_templete/add_post_templete_cubit.dart';
import 'package:post_bet/features/home/presentation/manager/details_photo/details_photo_cubit.dart';
import 'package:post_bet/features/home/presentation/manager/photo_cubit/photo_cubit.dart';
import 'package:post_bet/features/platform/data/repo/platforms_repo.dart';
import 'package:post_bet/features/platform/presentation/manager/cubit/platform_cubit.dart';
import 'package:post_bet/features/profile/data/profile_repo/profile_repo.dart';
import 'package:post_bet/features/profile/presentation/manager/edit%20profile%20cubit.dart';
import 'package:post_bet/features/settings/data/settings_repo/settings_repo.dart';
import 'package:post_bet/features/settings/presentation/manager/settings_cubit/cubit/settings_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:post_bet/l10n/l10n.dart';

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
              create: (context) => SettingsCubit(
                    getIt.get<SettingsRepository>(),
                    getIt.get<PlatFormsRepositery>(),
                  )..initializeLanguage()),
          BlocProvider(
            create: (context) => LoginCubit(getIt.get<AuthRepository>()),
          ),
          BlocProvider(
            create: (context) => EditProfileCubit(
              getIt.get<ProfileRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => PlatformCubit(
              getIt.get<PlatFormsRepositery>(),
            ),
          ),
          BlocProvider(
            create: (context) =>
                AddPostCubit(getIt.get<PostReposatory>())..mySharedPosts(),
          ),
          BlocProvider(
            create: (context) =>
                AddPostTempleteCubit(getIt.get<PostReposatory>()),
          ),
          BlocProvider(
            create: (context) => GetPostsCubit(getIt.get<ActivitiesRepo>()),
          ),
          BlocProvider(
            create: (context) => PhotoCubit(getIt.get<PhotoRepositiry>())
              ..getCollection()
              ..getPhotos(),
          ),
          BlocProvider(
            create: (context) => DetailsPhotosCubit(),
          ),
        ],
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return MaterialApp.router(
                locale: isEnglish ? const Locale('en') : const Locale('ar'),
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: L10n.all,
                debugShowCheckedModeBanner: false,
                routerConfig: AppRouter.router,
                theme: isDark ? AppTheme.darkTheme : AppTheme.lightTheme);
          },
        ),
      ),
    );
  }
}
