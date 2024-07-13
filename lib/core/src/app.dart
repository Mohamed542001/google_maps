import 'package:shared_preferences/shared_preferences.dart';

import 'app_export.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: MultiBlocProvider(
            providers: [
              BlocProvider<LocalizationBloc>(
                  create: (context) => getIt<LocalizationBloc>()),
            ],
            child: BlocBuilder<LocalizationBloc, LocalizationState>(
              buildWhen: (previous, current) => previous != current,
              builder: (_, localeState) {
                return MaterialApp(
                  localizationsDelegates: const [
                    AppLocalizationDelegate(),
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: AppLocalization.supportedLocales,
                  localeResolutionCallback: (deviceLocale, supportedLocales) {
                    for (var locale in supportedLocales) {
                      if (deviceLocale != null &&
                          deviceLocale.languageCode == locale.languageCode) {
                        return deviceLocale;
                      }
                    }
                    return supportedLocales.first;
                  },
                  initialRoute: AppRoutes.initScreen,
                  locale: localeState.locale,
                  title: 'Dr. Math',
                  restorationScopeId: 'app',
                  debugShowCheckedModeBanner: false,
                  theme: AppThemes.lightTheme,
                  onGenerateRoute: AppRouter.generateRoutes,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
