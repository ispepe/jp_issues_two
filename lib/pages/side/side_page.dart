import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:bin_jiang_yi_hao/notifiers/side_state.dart';
import 'package:bin_jiang_yi_hao/widgets/loading.dart';

import 'package:bin_jiang_yi_hao/models/side_entity.dart';

class SidePage extends StatefulWidget {
  const SidePage(
      {Key key,
      @required this.sideEntity,
      @required this.index,
      @required this.pageIndex})
      : super(key: key);

  final int index;
  final int pageIndex;
  final SideEntity sideEntity;

  @override
  _SidePageState createState() => _SidePageState();
}

class _SidePageState extends State<SidePage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  int max = 0;

  int _forward = 0;

  int _currentIndex = 0;

  bool _isLoading = true;

  List<MemoryImage> images = [];

  int get currentIndex => _currentIndex;

  int getFrame(int forward) {
    _currentIndex += forward;

    if (_currentIndex > max - 1) {
      _currentIndex = 0;
    } else if (_currentIndex < 1) {
      _currentIndex = max - 1;
    }

    return _currentIndex;
  }

  @override
  void initState() {
    super.initState();

    max = widget.sideEntity.frames?.length;
    Future.delayed(Duration(milliseconds: 200), () async {
      loadImages().then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    });
  }

  @override
  void dispose() {
    // _transformationController?.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);

    debugPrint('didUpdateWidget');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final size = MediaQuery.of(context).size;
    if (_isLoading) {
      return LoadingView(
        size: 40,
      );
    }

    List<Widget> childes = [_buildImage(size)];

    /// 如果当前热点分组是全部配套，则默认显示

    return Container(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onHorizontalDragUpdate: Provider.of<SideState>(context).isScale
            ? null
            : (DragUpdateDetails details) {
                if (details.delta == Offset.zero) return;
                if (mounted) {
                  setState(() {
                    _forward = getFrame((details.delta.dx < 0 ? 1 : -1));
                  });
                }
              },
        child: Stack(
          children: childes,
        ), //
      ),
    );
  }

  Widget _buildImage(Size size) {
    return RepaintBoundary(
      child: Image(
          gaplessPlayback: true,
          width: size.width,
          height: size.height,
          fit: BoxFit.fill,
          image: images[_forward]),
    );
  }

  @override
  bool get wantKeepAlive => true;

  /// NOTE: 9/7/20 待注意 它有一定机率会因为housePage页面而重新加载
  Future<void> loadImages() async {
    images.clear();

    for (var frame in widget.sideEntity.frames) {
      final ByteData bytes = await rootBundle.load('assets/images/$frame');
      final Uint8List data = bytes.buffer.asUint8List();
      images.add(MemoryImage(data.buffer.asUint8List()));
    }
  }
}
