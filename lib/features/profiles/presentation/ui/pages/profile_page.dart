import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:github_app/core/presentation/theme/adaptative_theme.dart';
import 'package:github_app/features/profiles/presentation/bloc/profile/profile_repositories_bloc.dart';
import 'package:github_app/features/profiles/presentation/bloc/profile/profile_repositories_state.dart';
import 'package:github_app/features/profiles/presentation/widgets/profile_about_widget.dart';
import 'package:github_app/features/profiles/presentation/widgets/profile_app_bar_back_button_widget.dart';
import 'package:github_app/features/profiles/presentation/widgets/profile_app_bar_content_widget.dart';
import 'package:github_app/features/profiles/presentation/widgets/profile_app_bar_title_widget.dart';

import 'package:github_app/features/repositories/presentation/dtos/owner_dto.dart';

class ProfilePage extends StatelessWidget {
  final OwnerDto ownerDto;
  const ProfilePage({Key? key, required this.ownerDto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: ProfileAppBarTitleWidget(title: ownerDto.login),
              leading: const ProfileAppBarBackButtonWidget(),
              backgroundColor: Colors.white,
              flexibleSpace: ProfileAppBarContentWidget(
                avatarUrl: ownerDto.avatarUrl,
              ),
              expandedHeight: MediaQuery.of(context).size.height / 3,
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AdaptativeTheme.minimunSpace, vertical: 20),
              sliver: SliverToBoxAdapter(
                child: ProfileAboutWidget(
                  name: ownerDto.login,
                  description: null,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AdaptativeTheme.minimunSpace, vertical: 20),
              sliver: SliverToBoxAdapter(
                  child: Text(
                AppLocalizations.of(context)!.repositories,
                style: Theme.of(context).textTheme.headline5,
              )),
            ),
            BlocBuilder<ProfileRepositoriesBloc, ProfileRepositoriesState>(
              builder: (_, state) {
                if (state is ProfileRepositoriesSuccess) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate((_, index) {
                      return Container();
                    }, childCount: 2),
                  );
                }
                if (state is ProfileRepositoriesLoading) {
                  return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()));
                }
                return const SliverToBoxAdapter(child: SizedBox());
              },
            ),
          ],
        ),
      ),
    );
  }
}
