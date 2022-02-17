import 'package:flutter/material.dart';
import 'package:github_app/core/presentation/theme/adaptative_theme.dart';

class ProfileAppBarBackButtonWidget extends StatelessWidget {
  const ProfileAppBarBackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: AdaptativeTheme.minimunSpace),
      child: Material(
        type: MaterialType.circle,
        color: Colors.deepPurple.withOpacity(.5),
        child: IconButton(
          splashColor: Colors.deepPurple.withOpacity(.8),
          padding: const EdgeInsets.all(AdaptativeTheme.minimunSpace),
          icon: const Icon(Icons.chevron_left_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
