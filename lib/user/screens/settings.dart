import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

import 'package:shiftopoly/helpers.dart';
import 'package:shiftopoly/state.dart';
import 'package:shiftopoly/users/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UsersWidgets().loggedInAppBar(
        context,
        // routePrevious: '/companies',
        showSettings: false,
      ),
      body: const Settings(),
    );
  }
}

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("Settings",
            style: Theme.of(context).textTheme.titleLarge,
          )
        ),
        Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ListTile(
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Dark mode enabled:",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  trailing: DropdownButton<String>(
                    value: sharedPrefs.darkMode,
                    items: <String>['Auto', 'Light', 'Dark']
                      .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    onChanged: (val) {
                      setState(() { sharedPrefs.darkMode = val!; });

                      // show restart confirmation snackbar
                      widgetHelpers.snackBarShow(
                        context,
                        "App restart required. Restart now?",
                        SnackBarAction(
                          label: "Restart",
                          onPressed: () { 
                            if (!kDebugMode) {
                              Restart.restartApp(webOrigin: '/');
                            }
                          }
                          // onPressed: () {
                        ),
                      );
                    }
                  ),
                ),
              ),
            ],
          )
        )
      ],
    );

  }
}
