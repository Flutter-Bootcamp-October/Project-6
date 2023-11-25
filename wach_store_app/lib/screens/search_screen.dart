import 'package:flutter/material.dart';
import 'package:wach_store_app/dataset/wach_dataset.dart';
import 'package:wach_store_app/global/global.dart';
import 'package:wach_store_app/models/wach_model.dart';
import 'package:wach_store_app/screens/products_details.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController editingController = TextEditingController();
  List<WatchProduct> filteredWachList = [];
  bool isTextFieldFocused = false;

  void searchWach(String query) {
    filteredWachList = WachProductList.where((wach) {
      final name = wach.name.toLowerCase();
      final input = query.toLowerCase();
      return name.contains(input);
    }).toList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WachProductList.clear();
    filteredWachList = WachProductList;
    for (var wach in WachDataSet) {
      WachProductList.add(WatchProduct.fromJson(wach));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                onChanged: (query) {
                  setState(() {
                    isTextFieldFocused = query.isNotEmpty;
                  });
                  searchWach(query);
                },
                controller: editingController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    color: Colors.grey,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.close_outlined,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      editingController.clear();
                      searchWach('');
                      setState(() {
                        isTextFieldFocused = false;
                      });
                    },
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
              ),
              if (isTextFieldFocused)
                Expanded(
                  child: ListView.builder(
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
                                    builder: (context) => ProductDetailsScreen(
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
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
