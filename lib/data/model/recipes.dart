import 'package:json_annotation/json_annotation.dart';

part 'recipes.g.dart';

@JsonSerializable()
class RecipesResponse {
  @JsonKey(name: 'count')
  final int count;
  @JsonKey(name: 'recipes')
  List<Recipes> recipes;

  RecipesResponse({
    required this.count,
    required this.recipes,
  });

  factory RecipesResponse.fromJson(Map<String, dynamic> json) =>
      _$RecipesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RecipesResponseToJson(this);
}

@JsonSerializable()
class Recipes {
  @JsonKey(name: 'publisher')
  final String publisher;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'source_url')
  final String sourceUrl;

  @JsonKey(name: 'recipe_id')
  final String recipeId;

  @JsonKey(name: 'image_url')
  final String imageUrl;

  @JsonKey(name: 'social_rank')
  final double socialRank;

  @JsonKey(name: 'publisher_url')
  final String publisherUrl;

  Recipes({
    required this.publisher,
    required this.title,
    required this.sourceUrl,
    required this.recipeId,
    required this.imageUrl,
    required this.socialRank,
    required this.publisherUrl,
  });

  factory Recipes.fromJson(Map<String, dynamic> json) =>
      _$RecipesFromJson(json);
  Map<String, dynamic> toJson() => _$RecipesToJson(this);
}
