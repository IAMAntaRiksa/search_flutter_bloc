import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_bloc/data/bloc/recipes_bloc.dart';
import 'package:search_bloc/data/model/recipes.dart';
import 'package:search_bloc/data/provider/api_client.dart';
import 'package:search_bloc/ui/widget/shimmer.dart';
import 'package:search_bloc/ui/widget/widget_state.dart';

class Dashboarrd extends StatelessWidget {
  const Dashboarrd({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RecipesBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: SearchFoods(
                          searchButtm: context.read<RecipesBloc>()));
                },
                icon: const Icon(Icons.search)),
          ],
        ),
        body: const DashboarrdBody(),
      ),
    );
  }
}

class DashboarrdBody extends StatefulWidget {
  const DashboarrdBody({Key? key}) : super(key: key);

  @override
  State<DashboarrdBody> createState() => _DashboarrdBodyState();
}

class _DashboarrdBodyState extends State<DashboarrdBody> {
  @override
  void initState() {
    context.read<RecipesBloc>().add(FetchPizza());
    super.initState();
  }

  ApiClientResponse apiClientResponse = ApiClientResponse();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipesBloc, RecipesState>(
      builder: (_, state) {
        if (state is RecipesLoading) {
          return WidgetState.loading(context);
        } else if (state is RecipesEmpatyState) {
          return WidgetState.empatyState(context);
        } else if (state is RecipesLoadingError) {
          return WidgetState.errorLoading(context);
        } else if (state is RecipesLoadingSuccses) {
          return ListItem(statea: state.recipesResponse);
        }

        return const ShimmerScreen();
      },
    );
  }
}

class ListItem extends StatelessWidget {
  final List<Recipes>? statea;
  const ListItem({
    Key? key,
    required this.statea,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: statea?.length,
        itemBuilder: (_, index) {
          return Stack(
            children: [
              Card(
                child: Row(
                  children: [
                    Container(
                      height: 150,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                (statea?[index].imageUrl).toString()),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        (statea?[index].title).toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        });
  }
}

class SearchFoods extends SearchDelegate {
  RecipesBloc searchButtm;
  SearchFoods({
    required this.searchButtm,
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchButtm.add(SearchPizza(searchButtom: query));
    return BlocBuilder<RecipesBloc, RecipesState>(
      builder: (_, state) {
        if (state is SearchLoading) {
          return WidgetState.loading(context);
        } else if (state is SearchLoadingError) {
          return WidgetState.errorLoading(context);
        } else if (state is SearchEmpatyState) {
          return WidgetState.empatyState(context);
        } else if (state is SearchLoadingSuccses) {
          return ListView.builder(
            itemCount: state.recipesSearch?.length,
            itemBuilder: (_, index) {
              return Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: CachedNetworkImage(
                          imageUrl:
                              (state.recipesSearch?[index].imageUrl).toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 2,
                        child: Text(
                          (state.recipesSearch?[index].publisher).toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 25),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
