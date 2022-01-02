// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipesResponse _$RecipesResponseFromJson(Map<String, dynamic> json) =>
    RecipesResponse(
      count: json['count'] as int,
      recipes: (json['recipes'] as List<dynamic>)
          .map((e) => Recipes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipesResponseToJson(RecipesResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'recipes': instance.recipes,
    };

Recipes _$RecipesFromJson(Map<String, dynamic> json) => Recipes(
      publisher: json['publisher'] as String,
      title: json['title'] as String,
      sourceUrl: json['source_url'] as String,
      recipeId: json['recipe_id'] as String,
      imageUrl: json['image_url'] as String,
      socialRank: (json['social_rank'] as num).toDouble(),
      publisherUrl: json['publisher_url'] as String,
    );

Map<String, dynamic> _$RecipesToJson(Recipes instance) => <String, dynamic>{
      'publisher': instance.publisher,
      'title': instance.title,
      'source_url': instance.sourceUrl,
      'recipe_id': instance.recipeId,
      'image_url': instance.imageUrl,
      'social_rank': instance.socialRank,
      'publisher_url': instance.publisherUrl,
    };
