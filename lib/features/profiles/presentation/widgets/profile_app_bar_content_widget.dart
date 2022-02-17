import 'package:flutter/material.dart';

class ProfileAppBarContentWidget extends StatelessWidget {
  final String avatarUrl;
  const ProfileAppBarContentWidget({Key? key, required this.avatarUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 5),
      ]),
      child: Image.network(
        avatarUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
