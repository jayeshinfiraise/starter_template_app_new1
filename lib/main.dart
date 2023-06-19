import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_template_app_new1/app/constants/string_constants.dart';
import 'package:starter_template_app_new1/app/l10n/l10n.dart';
import 'package:starter_template_app_new1/app/router/app_router.gr.dart';
import 'package:starter_template_app_new1/app/theme/app_theme.dart';
import 'package:starter_template_app_new1/injection.dart';

void main() {
  configureDependencies();
  runApp(StarterTemplateAppNew1());
}

class StarterTemplateAppNew1 extends StatelessWidget {
  StarterTemplateAppNew1({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        // App Name
        title: StringConstants.appName,
        theme: getIt<AppTheme>().lightTheme,
        darkTheme: getIt<AppTheme>().darkTheme,
    
        // Localization
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
    
        // Routing
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
      ),
    );
  }
}
