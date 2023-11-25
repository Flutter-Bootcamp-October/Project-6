// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/search_bloc/search_bloc.dart';
import '../widgets/search_widget.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(
                60), // change height depending on the child height
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Material(
                shadowColor: const Color.fromARGB(255, 201, 191, 191),
                child: Container(
                  child: TextField(
                    controller: controller,
                    onChanged: (query) {
                      context.read<SearchBloc>().add(FindSearchEvent(query));
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(25)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(25)),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xffb9b6b6),
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          context.read<SearchBloc>().add(FindSearchEvent(''));
                          controller.clear();
                        },
                        child: const Icon(
                          Icons.close,
                          color: Color(0xff0f141d),
                        ),
                      ),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: const Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if (state is SearchFindState) {
              return GridView.builder(
                  itemCount: state.searchResults.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    final product = state.searchResults[index];
                    return Container(
                      width: 130,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.grey),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              product["name"],
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              product['image'],
                              width: 80,
                              height: 80,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              product['price'],
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }
            return const SearchWidget();
          },
        ),
      ),
    );
  }
}
