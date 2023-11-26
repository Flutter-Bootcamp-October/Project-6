import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wach_store_app/BLoCs/search_bloc/search_bloc.dart';
import 'package:wach_store_app/BLoCs/search_bloc/search_event.dart';
import 'package:wach_store_app/BLoCs/search_bloc/search_state.dart';
import 'package:wach_store_app/global/global.dart';
import 'package:wach_store_app/screens/products_details.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  TextEditingController editingController = TextEditingController();

  void searchWach(String query) {
    filteredWachList = WachProductList.where((wach) {
      final name = wach.name.toLowerCase();
      final input = query.toLowerCase();
      return name.contains(input);
    }).toList();
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchForWatchState) {
                    return TextField(
                      onChanged: (query) {
                        context
                            .read<SearchBloc>()
                            .add(SearchForWatchEvent(watchName: query));
                        searchWach(state.query);
                      },
                      controller: editingController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search_rounded,
                          color: Colors.grey,
                        ),
                        suffixIcon: BlocListener<SearchBloc, SearchState>(
                          listener: (context, state) {
                            if (state is ClearFieldState) {
                              editingController.clear();
                              searchWach('');
                              filteredWachList.clear();
                            }
                          },
                          child: IconButton(
                            icon: const Icon(
                              Icons.close_outlined,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              context.read<SearchBloc>().add(ClearFieldEvent());
                            },
                          ),
                        ),
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    );
                  }
                  return TextField(
                    onChanged: (query) {
                      context
                          .read<SearchBloc>()
                          .add(SearchForWatchEvent(watchName: query));
                      searchWach(query);
                    },
                    controller: editingController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search_rounded,
                        color: Colors.grey,
                      ),
                      suffixIcon: BlocListener<SearchBloc, SearchState>(
                        listener: (context, state) {
                          if (state is ClearFieldState) {
                            editingController.clear();
                            searchWach('');
                            filteredWachList.clear();
                          }
                        },
                        child: IconButton(
                          icon: const Icon(
                            Icons.close_outlined,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            context.read<SearchBloc>().add(ClearFieldEvent());
                          },
                        ),
                      ),
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  );
                },
              ),
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: filteredWachList.length,
                      itemBuilder: (context, index) {
                        final wach = filteredWachList[index];
                        return ListTile(
                          title: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProductDetailsScreen(
                                            wach: wach,
                                          )));
                            },
                            child: Row(
                              children: [
                                const Icon(Icons.av_timer_outlined),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  wach.name,
                                  style: const TextStyle(fontFamily: 'Crimson'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
