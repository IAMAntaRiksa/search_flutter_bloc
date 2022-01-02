import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:search_bloc/data/model/recipes.dart';
import 'package:search_bloc/data/provider/api_client.dart';

part 'recipes_event.dart';
part 'recipes_state.dart';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  ApiClientResponse apiClientResponse = ApiClientResponse();
  RecipesBloc() : super(RecipesInitial()) {
    on<FetchPizza>(_mapFetchPizza);
    on<SearchPizza>(_mapSearchPizza);
  }

  FutureOr<void> _mapFetchPizza(
      FetchPizza event, Emitter<RecipesState> emit) async {
    emit(RecipesInitial());
    try {
      final fetchData = await apiClientResponse.fetchSearch();
      if (fetchData?.isEmpty ?? false) {
        emit(RecipesEmpatyState());
      } else {
        emit(RecipesLoadingSuccses(recipesResponse: fetchData ?? []));
      }
    } catch (e) {
      emit(const RecipesLoadingError(message: 'Failde to load data'));
    }
  }

  FutureOr<void> _mapSearchPizza(
      SearchPizza event, Emitter<RecipesState> emit) async {
    emit(SearchInitial());
    try {
      final fetchData =
          await apiClientResponse.searchFood(pizza: event.searchButtom);
      if (fetchData?.isNotEmpty ?? false) {
        emit(SearchLoadingSuccses(recipesSearch: fetchData ?? []));
      } else {
        emit(SearchEmpatyState());
      }
    } catch (e) {
      emit(const RecipesLoadingError(message: 'Failde to load data'));
    }
  }
}
