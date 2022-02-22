import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:github_app/core/presentation/theme/theme_dark.dart';
import 'package:github_app/core/presentation/theme/theme_default.dart';
import 'package:github_app/core/utils/routes.dart';
import 'package:github_app/features/profiles/presentation/bloc/profile/profile_repositories_bloc.dart';
import 'package:github_app/features/profiles/presentation/ui/pages/profile_page.dart';
import 'package:github_app/features/repositories/presentation/bloc/repositories/repositories_bloc.dart';
import 'package:github_app/features/repositories/presentation/bloc/repositories/search/repositories_search_bloc.dart';
import 'package:github_app/features/repositories/presentation/dtos/owner_dto.dart';
import 'package:github_app/features/repositories/presentation/ui/pages/repositories_page.dart';

class GitHubApp extends StatelessWidget {
  const GitHubApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "GitHub App",
      initialRoute: "/repositories",
      theme: themeLight,
      darkTheme: themeDark,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('pt')],
      routes: {
        Routes.REPOSITORIES: (context) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => RepositoriesBloc(GetIt.I())),
                BlocProvider(create: (_) => RepositoriesSearchBloc()),
              ],
              child: const RepositoriesPage(),
            ),
        Routes.PROFILE: (context) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => ProfileRepositoriesBloc(GetIt.I()))
              ],
              child: ProfilePage(
                ownerDto:
                    ModalRoute.of(context)!.settings.arguments as OwnerDto,
              ),
            ),
      },
    );
  }
}
