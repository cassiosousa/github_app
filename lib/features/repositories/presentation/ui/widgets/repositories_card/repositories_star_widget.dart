import 'package:flutter/material.dart';
import 'package:github_app/core/presentation/theme/adaptative_theme.dart';

class RepositoriesStarWidget extends StatelessWidget {
  final int quantity;
  const RepositoriesStarWidget({Key? key, required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star_rounded,
          color: Theme.of(context).primaryColor,
          size: AdaptativeTheme.minIconSize,
        ),
        Text(
          "$quantity",
          style: Theme.of(context).textTheme.bodyText2,
        )
      ],
    );
  }
}
