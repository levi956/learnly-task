import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rnly/core/core.dart';

import 'app.dart';

void main() async {
  await Setups.run();
  runApp(
    MultiProvider(
      providers: appProviders,
      child: const App(),
    ),
  );
}
