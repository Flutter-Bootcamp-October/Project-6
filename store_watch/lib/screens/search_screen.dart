import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_watch/blocs/bloc_Auth/bloc/bloc/search_product_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchProductBloc, SearchProductState>(
      builder: (context, state) {
        final searchResults = state is SearchState ? state.searchResults : [];
        return Scaffold(
          backgroundColor: const Color(0xffffffff),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            bottom: buildAppBarBottom(context.read<SearchProductBloc>()),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: GridView.builder(
                itemCount: searchResults.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 8, crossAxisSpacing: 8, crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final product = searchResults[index];
                  return Container(
                    width: 130,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: const Color(0xfff9f8f8)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            product["name"],
                            style: const TextStyle(
                                fontSize: 18, color: Colors.black),
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
                                fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        );
      },
    );
  }
}

TextEditingController controller = TextEditingController();
String enteredText = '';

PreferredSizeWidget buildAppBarBottom(searchProduct) {
  return PreferredSize(
      preferredSize: const Size.fromHeight(
          60), // change height depending on the child height
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Material(
          shadowColor: const Color.fromARGB(255, 201, 191, 191),
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xffefefef),
                  spreadRadius: 5,
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: TextField(
              controller: controller,
              onChanged: (query) {
                searchProduct.add(SearchEvent(query: query));
              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25)),
                prefixIcon: InkWell(
                  onTap: () {
                    enteredText = controller.text;
                    searchProduct.add(SearchEvent(query: enteredText));
                  },
                  child: const Icon(
                    Icons.search,
                    color: Color(0xffb9b6b6),
                  ),
                ),
                suffixIcon: InkWell(
                  onTap: () {
                    controller.clear();
                    searchProduct.add(SearchEvent());
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
      ));
}
