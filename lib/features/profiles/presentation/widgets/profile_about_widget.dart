import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:github_app/core/presentation/theme/adaptative_theme.dart';

class ProfileAboutWidget extends StatelessWidget {
  final String name;
  final String? description;
  const ProfileAboutWidget({Key? key, required this.name, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${AppLocalizations.of(context)!.about} $name",
            style: Theme.of(context).textTheme.headline5),
        Padding(
          padding: const EdgeInsets.only(top: AdaptativeTheme.minimunSpace),
          child: Visibility(
            visible: description != null,
            child: Text(description ?? "",
                style: Theme.of(context).textTheme.bodyText2),
            replacement: Text(
              AppLocalizations.of(context)!.noDescription,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        )
      ],
    );
  }
}
