import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({
    Key key,
  }) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage>
    with AutomaticKeepAliveClientMixin {
  int max = 0;

  int _forward = 0;

  int _currentIndex = 0;

  bool _isLoading = true;

  List<MemoryImage> images = [];

  int get currentIndex => _currentIndex;

  List<String> _frames;

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

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _frames = [
        "side/big/0000.jpg",
        "side/big/0001.jpg",
        "side/big/0002.jpg",
        "side/big/0003.jpg",
        "side/big/0004.jpg",
        "side/big/0005.jpg",
        "side/big/0006.jpg",
        "side/big/0007.jpg",
        "side/big/0008.jpg",
        "side/big/0009.jpg",
        "side/big/0010.jpg",
        "side/big/0011.jpg",
        "side/big/0012.jpg",
        "side/big/0013.jpg",
        "side/big/0014.jpg",
        "side/big/0015.jpg",
        "side/big/0016.jpg",
        "side/big/0017.jpg",
        "side/big/0018.jpg",
        "side/big/0019.jpg",
        "side/big/0020.jpg",
        "side/big/0021.jpg",
        "side/big/0022.jpg",
        "side/big/0023.jpg",
        "side/big/0024.jpg",
        "side/big/0025.jpg",
        "side/big/0026.jpg",
        "side/big/0027.jpg",
        "side/big/0028.jpg",
        "side/big/0029.jpg",
        "side/big/0030.jpg",
        "side/big/0031.jpg",
        "side/big/0032.jpg",
        "side/big/0033.jpg",
        "side/big/0034.jpg",
        "side/big/0035.jpg",
        "side/big/0036.jpg",
        "side/big/0037.jpg",
        "side/big/0038.jpg",
        "side/big/0039.jpg",
        "side/big/0040.jpg",
        "side/big/0041.jpg",
        "side/big/0042.jpg",
        "side/big/0043.jpg",
        "side/big/0044.jpg",
        "side/big/0045.jpg",
        "side/big/0046.jpg",
        "side/big/0047.jpg",
        "side/big/0048.jpg",
        "side/big/0049.jpg",
        "side/big/0050.jpg",
        "side/big/0051.jpg",
        "side/big/0052.jpg",
        "side/big/0053.jpg",
        "side/big/0054.jpg",
        "side/big/0055.jpg",
        "side/big/0056.jpg",
        "side/big/0057.jpg",
        "side/big/0058.jpg",
        "side/big/0059.jpg",
        "side/big/0060.jpg",
        "side/big/0061.jpg",
        "side/big/0062.jpg",
        "side/big/0063.jpg",
        "side/big/0064.jpg",
        "side/big/0065.jpg",
        "side/big/0066.jpg",
        "side/big/0067.jpg",
        "side/big/0068.jpg",
        "side/big/0069.jpg",
        "side/big/0070.jpg",
        "side/big/0071.jpg",
        "side/big/0072.jpg",
        "side/big/0073.jpg",
        "side/big/0074.jpg",
        "side/big/0075.jpg",
        "side/big/0076.jpg",
        "side/big/0077.jpg",
        "side/big/0078.jpg",
        "side/big/0079.jpg",
        "side/big/0080.jpg",
        "side/big/0081.jpg",
        "side/big/0082.jpg",
        "side/big/0083.jpg",
        "side/big/0084.jpg",
        "side/big/0085.jpg",
        "side/big/0086.jpg",
        "side/big/0087.jpg",
        "side/big/0088.jpg",
        "side/big/0089.jpg",
        "side/big/0090.jpg",
        "side/big/0091.jpg",
        "side/big/0092.jpg",
        "side/big/0093.jpg",
        "side/big/0094.jpg",
        "side/big/0095.jpg",
        "side/big/0096.jpg",
        "side/big/0097.jpg",
        "side/big/0098.jpg",
        "side/big/0099.jpg",
        "side/big/0100.jpg",
        "side/big/0101.jpg",
        "side/big/0102.jpg",
        "side/big/0103.jpg",
        "side/big/0104.jpg",
        "side/big/0105.jpg",
        "side/big/0106.jpg",
        "side/big/0107.jpg",
        "side/big/0108.jpg",
        "side/big/0109.jpg",
        "side/big/0110.jpg",
        "side/big/0111.jpg",
        "side/big/0112.jpg",
        "side/big/0113.jpg",
        "side/big/0114.jpg",
        "side/big/0115.jpg",
        "side/big/0116.jpg",
        "side/big/0117.jpg",
        "side/big/0118.jpg",
        "side/big/0119.jpg",
        "side/big/0120.jpg"
      ];

      max = _frames?.length;
      loadImages().then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final size = MediaQuery.of(context).size;
    if (_isLoading) {
      return Container(
        child: Text('loading...'),
      );
    }

    List<Widget> childes = [_buildImage(size)];

    /// 如果当前热点分组是全部配套，则默认显示

    return Container(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onHorizontalDragUpdate: (DragUpdateDetails details) {
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
    for (var frame in _frames) {
      final ByteData bytes = await rootBundle.load('assets/images/$frame');
      final Uint8List data = bytes.buffer.asUint8List();
      images.add(MemoryImage(data.buffer.asUint8List()));
    }
  }
}
