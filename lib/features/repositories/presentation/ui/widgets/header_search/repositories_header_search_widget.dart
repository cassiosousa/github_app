import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_app/features/repositories/presentation/bloc/repositories/search/repositories_search.dart';

class RepositoriesHeaderSearchWidget extends StatelessWidget {
  final Function(String) onComplete;
  const RepositoriesHeaderSearchWidget({Key? key, required this.onComplete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            child:
                BlocConsumer<RepositoriesSearchBloc, RepositoriesSearchState>(
                    listener: (context, state) {
          if (state is RepositoriesSearchSuccess) {
            onComplete(state.text);
          }
        }, builder: (context, state) {
          return TextField(
            onChanged: (value) {
              context
                  .read<RepositoriesSearchBloc>()
                  .add(RepositoriesSearchWriter(value));
            },
          );
        }))
      ],
    );
  }
}
