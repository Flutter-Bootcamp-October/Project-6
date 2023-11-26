import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/blocs/theme_bloc/theme_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                const Text("Application mood"),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      context.read<ThemeBloc>().add(ChangeThemeEvent("light"));
                    },
                    icon: const Icon(
                      Icons.light_mode,
                      color: Colors.amber,
                    )),
                IconButton(
                    onPressed: () {
                      context.read<ThemeBloc>().add(ChangeThemeEvent("dark"));
                    },
                    icon: const Icon(
                      Icons.dark_mode,
                      color: Colors.blueGrey,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
