import 'dart:convert' as convert show jsonDecode, jsonEncode;

import 'package:bin_jiang_yi_hao/pages/multi_side/multi_side_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import 'package:bin_jiang_yi_hao/notifiers/side_state.dart';
import 'package:bin_jiang_yi_hao/themes/themes.dart';

import 'models/page_entity.dart';

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
    return OKToast(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => SideState(),
            )
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            color: Colors.white,
            title: 'TestProject',
            theme: themeData(),
            // supportedLocales: [
            //   const Locale('zh', 'CH'),
            // ],
            // locale: Locale('zh', 'CN'),
            // home: IndexPage(),
            // initialRoute: IndexPage.routeName,
            home: IndexPage(),
          ),
        ),

        /// Toast 配置
        backgroundColor: Colors.black54,
        textPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        radius: 20.0,
        position: ToastPosition.bottom);
  }
}

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  PageEntity pageEntity;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      rootBundle.loadString('assets/data/binjiangyihao.json').then((jsonData) {
        if (jsonData == null) return;
        var map = convert.jsonDecode(jsonData);
        pageEntity = PageEntity().fromJson(map);
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageEntity != null
          ? MultiSidePage(multiSideEntity: pageEntity, index: 0, pageIndex: 0)
          : Container(),
    );
  }
}
