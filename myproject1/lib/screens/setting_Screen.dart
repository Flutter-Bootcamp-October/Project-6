import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopingpriject/blocs/bloc/bloc2/bloc/theme_bloc.dart';
import 'package:shopingpriject/blocs/bloc/bloc2/bloc/theme_event.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seettings'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text('changes them :'),
              Spacer(),
              IconButton(
                  onPressed: () {
                    context.read<ThemeBloc>().add(ChangeThemeEvent('light'));
                  },
                  icon: const Icon(
                    Icons.sunny,
                    color: Colors.amber,
                  )),
              IconButton(
                  onPressed: () {
                    context.read<ThemeBloc>().add(ChangeThemeEvent('dark'));
                  },
                  icon: const Icon(
                    Icons.nightlight_round,
                    color: Colors.blue,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
