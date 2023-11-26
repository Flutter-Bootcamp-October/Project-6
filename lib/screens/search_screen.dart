import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/blocs/search_bloc/search_bloc.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/widgets/search_widget.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreen({super.key, required this.product});

  final Product product;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Material(
              shadowColor: const Color.fromARGB(255, 201, 191, 191),
              child: Container(
                child: TextField(
                  controller: controller,
                  onChanged: (query) {
                    context
                        .read<SearchBloc>()
                        .add(FindSearchEvent(query, product));
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xffb9b6b6),
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        context
                            .read<SearchBloc>()
                            .add(FindSearchEvent('', product));
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
          ),
        ),
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
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  final searchProduct = state.searchResults[index];
                  return Container(
                    width: 130,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.grey,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            searchProduct.name,
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Image.asset(
                            searchProduct.image,
                            width: 80,
                            height: 80,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '\$${searchProduct.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return const SearchWidget();
          },
        ),
      ),
    );
  }
}
