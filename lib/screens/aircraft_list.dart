import 'package:flutter/material.dart';

import '../sharedprefrences/SharedPrefs.dart';

class AirCraftList extends StatefulWidget {
  const AirCraftList({super.key});

  @override
  State<AirCraftList> createState() => _AirCraftListState();
}

class _AirCraftListState extends State<AirCraftList> {
  static String? accessToken = SharedPreferencesHelper.accessToken;

  @override
  Widget build(BuildContext context) {
    print('Token: $accessToken');

    return Scaffold();
  }
}
