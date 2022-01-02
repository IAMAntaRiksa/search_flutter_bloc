part of 'recipes_bloc.dart';

class RecipesState extends Equatable {
  const RecipesState();

  @override
  List<Object> get props => [];
}

class RecipesInitial extends RecipesState {}

class RecipesLoading extends RecipesState {}

class RecipesLoadingSuccses extends RecipesState {
  final List<Recipes>? recipesResponse;

  const RecipesLoadingSuccses({
    required this.recipesResponse,
  });

  @override
  List<Object> get props => [recipesResponse ?? []];
}

class RecipesLoadingError extends RecipesState {
  final String message;
  const RecipesLoadingError({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}

class RecipesEmpatyState extends RecipesState {}

/// Food Search

class SearchInitial extends RecipesState {}

class SearchLoading extends RecipesState {}

class SearchLoadingSuccses extends RecipesState {
  final List<Recipes>? recipesSearch;

  const SearchLoadingSuccses({
    required this.recipesSearch,
  });

  @override
  List<Object> get props => [recipesSearch ?? []];
}

class SearchLoadingError extends RecipesState {
  final String message;
  const SearchLoadingError({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}

class SearchEmpatyState extends RecipesState {}
