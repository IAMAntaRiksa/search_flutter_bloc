part of 'recipes_bloc.dart';

class RecipesEvent extends Equatable {
  const RecipesEvent();

  @override
  List<Object> get props => [];
}

class FetchPizza extends RecipesEvent {}

class SearchPizza extends RecipesEvent {
  final String searchButtom;

  const SearchPizza({
    required this.searchButtom,
  });
}
