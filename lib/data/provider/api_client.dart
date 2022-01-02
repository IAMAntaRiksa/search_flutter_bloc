import 'package:dio/dio.dart';
import 'package:search_bloc/data/model/recipes.dart';

const String _baseURL = 'https://forkify-api.herokuapp.com/api';

class ApiClientResponse {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: _baseURL,
    connectTimeout: 30000,
    sendTimeout: 30000,
  ));

  Future<List<Recipes>?> fetchSearch() async {
    try {
      Response response = await _dio.get('/search?q=pizza');

      if (response.statusCode == 200) {
        List<Recipes> recipesResponse =
            RecipesResponse.fromJson(response.data).recipes;
        return recipesResponse;
      }
    } catch (e) {
      e.toString();
    }
  }

  Future<List<Recipes>?> searchFood({String? pizza}) async {
    List<Recipes>? data;
    try {
      Response response = await _dio.get('/search?q=$pizza', queryParameters: {
        'q': pizza,
      });

      List<Recipes> recipesSearch =
          RecipesResponse.fromJson(response.data).recipes;
      return data = recipesSearch;
    } catch (e) {
      e.toString();
    }
    return data;
  }
}
