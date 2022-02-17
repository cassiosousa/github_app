import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_app/features/repositories/presentation/bloc/repositories/repositories_bloc.dart';
import 'package:github_app/features/repositories/presentation/bloc/repositories/repositories_event.dart';
import 'package:github_app/features/repositories/presentation/bloc/repositories/repositories_state.dart';
import 'package:github_app/features/repositories/presentation/ui/widgets/repositories_card/repositories_card_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RepositoriesPage extends StatefulWidget {
  const RepositoriesPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RepositoriesPage> createState() => _RepositoriesPageState();
}

class _RepositoriesPageState extends State<RepositoriesPage> {
  @override
  void initState() {
    super.initState();
    context.read<RepositoriesBloc>().add(RepositoriesSearch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          bottom: false,
          child: Container(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text(
                    AppLocalizations.of(context)!.repositories,
                  ),
                ),
                BlocBuilder<RepositoriesBloc, RepositoriesState>(
                  builder: (_, state) {
                    if (state is RepositoriesSuccess) {
                      return SliverAnimatedList(
                        initialItemCount: state.repositories.length,
                        itemBuilder: (context, index, animation) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0, 0.3),
                              end: Offset.zero,
                            ).animate(animation),
                            child: RepositoriesCard(
                                repositoryDto: state.repositories[index]),
                          );
                        },
                      );
                    }
                    if (state is RepositoriesLoading) {
                      return const SliverFillRemaining(
                          child: Center(child: CircularProgressIndicator()));
                    }
                    return const SliverToBoxAdapter(child: SizedBox());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
