import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gimme/common/theme.dart';
import 'package:gimme/screens/catalog.dart';
import 'package:gimme/screens/account.dart';
import 'package:gimme/screens/order_history.dart';

void main() {
  runApp(Gimme());
}

class Gimme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Support landscape
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Gimme',
      theme: appTheme(context),
      initialRoute: '/catalog',
      routes: {
        '/catalog': (context) => CatalogScreen(),
        '/account': (context) => AccountScreen(),
        '/orders': (context) => OrderHistoryScreen(),
      },
    );
  }
}
