import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_list/providers.dart';

import 'package:flutter_todo_list/state.dart';
import 'package:flutter_todo_list/widgets.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: baseWidgets.appBar(
        context,
        ref,
        hideSettings: true,
      ),
      body: const Settings(),
    );
  }
}

class Settings extends ConsumerStatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends ConsumerState<Settings> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Settings",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              _itemDarkMode(),
            ],
          ),
        )
      ],
    );
  }

  Widget _itemDarkMode() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Dark mode enabled:",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        trailing: DropdownButton<String>(
          value: sharedPrefs.darkMode,
          items: ['light', 'dark', 'auto']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child:
                  // capitalize the label
                  Text(value[0].toUpperCase() + value.substring(1)),
            );
          }).toList(),
          onChanged: (String? value) {
            ref.read(themeProvider.notifier).state = value!;
            sharedPrefs.darkMode = value;

            setState(() {}); // update the widget even if the theme is the same
          },
        ),
      ),
    );
  }
}
