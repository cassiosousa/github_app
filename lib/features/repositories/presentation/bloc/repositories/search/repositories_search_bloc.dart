import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_app/features/repositories/presentation/bloc/repositories/search/repositories_search_event.dart';
import 'package:github_app/features/repositories/presentation/bloc/repositories/search/repositories_search_state.dart';

class RepositoriesSearchBloc
    extends Bloc<RepositoriesSearchEvent, RepositoriesSearchState> {
  Timer debounce = Timer(const Duration(seconds: 2), () {});
  RepositoriesSearchBloc() : super(const RepositoriesSearchSuccess("")) {
    on<RepositoriesSearchInit>(_onInit);
    on<RepositoriesSearchWriter>(_onWriter);
    on<RepositoriesSearchFinish>(_onFinish);
  }
  void _onInit(RepositoriesSearchInit event,
      Emitter<RepositoriesSearchState> emit) async {
    emit(const RepositoriesSearchSuccess(""));
  }

  void _onWriter(RepositoriesSearchWriter event,
      Emitter<RepositoriesSearchState> emit) async {
    emit(RepositoriesSearchProgress(event.text));
    _producesFinish(event.text);
  }

  void _onFinish(RepositoriesSearchFinish event,
      Emitter<RepositoriesSearchState> emit) async {
    emit(RepositoriesSearchSuccess(event.text));
  }

  void _producesFinish(String text) {
    debounce.cancel();
    debounce = Timer(const Duration(seconds: 2), () {
      print("entrou1 $text");
      if (text.isNotEmpty) {
        print("entrou2 $text");
        add(RepositoriesSearchFinish(text));
      }
    });
  }
}
