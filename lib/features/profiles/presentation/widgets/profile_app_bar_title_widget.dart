import 'package:flutter/material.dart';
import 'package:github_app/core/presentation/theme/adaptative_theme.dart';

class ProfileAppBarTitleWidget extends StatelessWidget {
  final String title;
  const ProfileAppBarTitleWidget({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(top: AdaptativeTheme.minimunSpace),
          padding: const EdgeInsets.all(AdaptativeTheme.minimunSpace),
          decoration: BoxDecoration(
            color: Colors.deepPurple.withOpacity(.5),
            borderRadius: BorderRadius.circular(AdaptativeTheme.largeRounded),
          ),
          child: Text(title),
        ),
      ],
    );
  }
}
