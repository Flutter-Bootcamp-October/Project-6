import 'package:flutter/material.dart';
import '/data/data_set.dart';

class ProductDisplayBySort extends StatelessWidget {
  const ProductDisplayBySort({super.key, required this.containerType});
  final String containerType;
  List<Map<String, dynamic>> sortDataByPrice(List<Map<String, dynamic>> data) {
    dataSets.sort((a, b) {
      final double price1 = double.parse(a['price']);
      final double price2 = double.parse(b['price']);
      return price1.compareTo(price2);
    });
    return data;
  }

  List<Map<String, dynamic>> sortDataByPopularity(
      List<Map<String, dynamic>> data, String key) {
    dataSets.sort((a, b) {
      int Popularity1 = a[key];
      int popularity2 = b[key];
      return Popularity1.compareTo(popularity2);
    });
    return data;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> sortedDataPrice = sortDataByPrice(dataSets);
    List<Map<String, dynamic>> sortedDataPopularity =
        sortDataByPopularity(dataSets, 'popularity');

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: containerType == 'price'
            ? GridView.builder(
                itemCount: sortedDataPrice.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 8, crossAxisSpacing: 8, crossAxisCount: 2),
                itemBuilder: (context, index) {
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
                          Image.asset(
                            '${sortedDataPrice[index]['image']}',
                            width: 100,
                            height: 100,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text('${sortedDataPrice[index]['name']}'),
                          Text(
                            'Price: ${sortedDataPrice[index]['price']}',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  );
                })
            : GridView.builder(
                itemCount: sortedDataPopularity.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 8, crossAxisSpacing: 8, crossAxisCount: 2),
                itemBuilder: (context, index) {
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
                          Image.asset(
                            '${sortedDataPopularity[index]['image']}',
                            width: 100,
                            height: 100,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text('${sortedDataPopularity[index]['name']}'),
                          Text(
                            'Popularity :${sortedDataPopularity[index]['popularity']}',
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
  }
}
