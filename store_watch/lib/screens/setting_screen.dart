import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_watch/blocs/theme_bloc/them_bloc.dart';
import 'package:store_watch/blocs/theme_bloc/them_event.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Text("Change app theme"),
            const Spacer(),
            IconButton(
              onPressed: () {
                context
                    .read<ThemeBloc>()
                    .add(ChangeThemeEvent(themeText: "light"));
              },
              icon: const Icon(
                Icons.sunny,
                color: Colors.amber,
              ),
            ),
            IconButton(
                onPressed: () {
                  context
                      .read<ThemeBloc>()
                      .add(ChangeThemeEvent(themeText: "dark"));
                },
                icon: Icon(
                  Icons.nightlight,
                  color: Colors.blue[800],
                ))
          ],
        ),
      ),
    );
  }
}
