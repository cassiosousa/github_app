import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_app/features/repositories/presentation/bloc/repositories/search/repositories_search.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RepositoriesHeaderSearchWidget extends StatelessWidget {
  final Function(String) onComplete;
  final String value;
  const RepositoriesHeaderSearchWidget(
      {Key? key, required this.onComplete, required this.value})
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
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText:
                  value.isEmpty ? AppLocalizations.of(context)!.search : value,
              hintStyle: const TextStyle(color: Colors.white),
              contentPadding: const EdgeInsets.all(5),
              filled: false,
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusColor: Colors.white,
            ),
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
