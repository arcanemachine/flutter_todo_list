import 'package:flutter/material.dart';

import 'package:shiftopoly/users/widgets.dart';

class AppWidgets {
  init() async {}
  static final users = UsersWidgets();
  static final misc = MiscWidgets();
}

class MiscWidgets {
  Widget loadingScreen(BuildContext context, String? thingBeingLoaded) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                  height: 32.0, width: 32.0, child: CircularProgressIndicator()),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Loading${
                    thingBeingLoaded != null ? ' $thingBeingLoaded' : ''
                  }...",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ],
      )
    );
  }

  Widget longText(String text, { TextAlign? textAlign }) {
    /* A widget that automatically wraps text as needed. */
    return Expanded(
      child: Column(
        children: [
          Text(text, textAlign: textAlign ?? TextAlign.start),
        ],
      ),
    );
  }

}
