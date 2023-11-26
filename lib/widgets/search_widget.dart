import 'package:flutter/material.dart';
import 'package:shopping_app/data/global.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
                    product.name,
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    product.image,
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    product.price.toString(),
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
