import 'package:flutter/material.dart';
import 'package:github_app/core/presentation/theme/adaptative_theme.dart';
import 'package:github_app/core/presentation/ui/widgets/avatar/avatar_widget.dart';
import 'package:github_app/core/utils/routes.dart';
import 'package:github_app/features/repositories/presentation/dtos/repository_dto.dart';
import 'package:github_app/features/repositories/presentation/ui/widgets/repositories_card/repositories_star_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RepositoriesCard extends StatelessWidget {
  final RepositoryDto repositoryDto;
  const RepositoriesCard({Key? key, required this.repositoryDto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(Routes.PROFILE, arguments: repositoryDto.ownerDto);
      },
      child: Card(
        margin: const EdgeInsets.fromLTRB(
          AdaptativeTheme.defaultSpace,
          AdaptativeTheme.minimunSpace,
          AdaptativeTheme.defaultSpace,
          AdaptativeTheme.noneSpace,
        ),
        child: Padding(
          padding: const EdgeInsets.all(AdaptativeTheme.minimunSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              right: AdaptativeTheme.minimunSpace),
                          width: 100,
                          height: 100,
                          child: AvatarWidget(
                            avatarUrl: repositoryDto.ownerDto.avatarUrl,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: AdaptativeTheme.minimunExtraSpace,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  repositoryDto.name,
                                  overflow: TextOverflow.fade,
                                  maxLines: 1,
                                  softWrap: false,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: AdaptativeTheme.minimunSpace),
                                  child: RepositoriesStarWidget(
                                      quantity: repositoryDto.star),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
