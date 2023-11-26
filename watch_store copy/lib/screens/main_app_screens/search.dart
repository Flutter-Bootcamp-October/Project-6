import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/blocs/search_bloc/search_bloc.dart';
import 'package:watch_store/models/product.dart';
import 'package:watch_store/widgets/products_row.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool found = false;
  late Product searchProduct;
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 380,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(63, 158, 158, 158)),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                          hintText: "Search for a city or airport",
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 158, 158, 158)),
                          prefixIcon: InkWell(
                            onTap: () {
                              ///////////////
                              context
                                  .read<SearchBloc>()
                                  .add(SearchEvent(searchController.text));
                              // for (var product in listProducts) {
                              //   if (product.name.toLowerCase() ==
                              //       searchController.text.toLowerCase()) {
                              //     searchProduct = product;
                              //     found = true;
                              //     setState(() {});
                              //     break;
                              //   }
                              // }
                              //////////////
                            },
                            child: const Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 158, 158, 158),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchFoundState) {
                  return ProductView(product: state.product);
                } else {
                  return const Text("");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
