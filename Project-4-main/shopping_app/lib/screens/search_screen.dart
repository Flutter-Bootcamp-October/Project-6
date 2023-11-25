import 'package:flutter/material.dart';
import 'package:input_history_text_field/input_history_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              const Text("Let's Help you find your perfect watch..",
                  style:
                      TextStyle(fontSize: 30, fontFamily: 'RomanaBeckerDemi')),
              const SizedBox(height: 50),
              SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                height: 60,
                child: InputHistoryTextField(
                  historyIconColor: const Color.fromARGB(255, 119, 119, 119),
                  historyKey: "01",
                  listStyle: ListStyle.List,
                  decoration: InputDecoration(
                      hintText: "Search",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
