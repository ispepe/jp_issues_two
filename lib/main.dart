import 'package:flutter/material.dart';

import 'index_page.dart';

void main() async {
//  Provider.debugCheckInvalidValueType = null;

  /// Flutter 1.12
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      title: 'TestProject',
      // supportedLocales: [
      //   const Locale('zh', 'CH'),
      // ],
      // locale: Locale('zh', 'CN'),
      // home: IndexPage(),
      // initialRoute: IndexPage.routeName,
      home: IndexPage(),
    );
  }
}
