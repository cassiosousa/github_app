import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_app/features/repositories/presentation/bloc/repositories/repositories.dart';
import 'package:github_app/features/repositories/presentation/ui/widgets/repositories_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RepositoriesPage extends StatefulWidget {
  const RepositoriesPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RepositoriesPage> createState() => _RepositoriesPageState();
}

class _RepositoriesPageState extends State<RepositoriesPage> {
  bool _isFilter = false;
  var currentText = "";
  @override
  void initState() {
    super.initState();
    context.read<RepositoriesBloc>().add(const RepositoriesSearch("flutter"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification.metrics.atEdge) {
            if (notification.metrics.pixels == 0) {
              setState(() {
                _isFilter = false;
              });
            }
          }
          return true;
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              systemOverlayStyle: SystemUiOverlayStyle.light,
              title: GestureDetector(
                onTap: () {
                  setState(() {
                    _isFilter = !_isFilter;
                  });
                },
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (widget, animation) => ScaleTransition(
                    scale: animation,
                    child: widget,
                  ),
                  child: !_isFilter
                      ? Text(
                          "${AppLocalizations.of(context)!.repositories}$currentText",
                        )
                      : RepositoriesHeaderSearchWidget(
                          value: currentText,
                          onComplete: (value) {
                            currentText = " $value";
                            context
                                .read<RepositoriesBloc>()
                                .add(RepositoriesSearch(value));
                          }),
                ),
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
    );
  }
}
