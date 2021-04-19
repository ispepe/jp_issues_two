import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingView extends StatelessWidget {
  final double size;

  LoadingView({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitCircle(
        color: Theme.of(context).primaryColor,
        size: size,
      ),
    );
  }
}
