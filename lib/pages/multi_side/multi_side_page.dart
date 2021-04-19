import 'package:bin_jiang_yi_hao/models/page_entity.dart';
import 'package:bin_jiang_yi_hao/notifiers/side_state.dart';
import 'package:bin_jiang_yi_hao/pages/side/side_page.dart';
import 'package:bin_jiang_yi_hao/utils/image_utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class MultiSidePage extends StatefulWidget {
  const MultiSidePage(
      {Key key,
      @required this.multiSideEntity,
      @required this.index,
      @required this.pageIndex})
      : super(key: key);
  final PageEntity multiSideEntity;

  final int index;
  final int pageIndex;

  @override
  _MultiSidePageState createState() => _MultiSidePageState();
}

class _MultiSidePageState extends State<MultiSidePage>
    with AutomaticKeepAliveClientMixin {
  int _sideIndex = 0;

  PageController _verticalController;

  @override
  void initState() {
    super.initState();
    _verticalController = PageController(initialPage: _sideIndex);
  }

  @override
  void dispose() {
    _verticalController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    var padding = MediaQuery.of(context).padding;
    var size = MediaQuery.of(context).size;

    final maxSize = Size(
        widget.multiSideEntity.width *
            (size.height / widget.multiSideEntity.height),
        size.height);

    ScreenUtil.init(
      BoxConstraints.loose(maxSize),
      Orientation.portrait,
      designSize:
          Size(widget.multiSideEntity.width, widget.multiSideEntity.height),
      allowFontScaling: false,
    );

    return Container(
      child: widget.multiSideEntity.sideEntities != null
          ? Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: size.width,
                  height: size.height,
                  child: FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: ImageUtils.getImageProvider(
                        widget.multiSideEntity.bgImage),
                    fit: BoxFit.fill,
                  ),
                ),
                widget.multiSideEntity.titleImage != null
                    ? Positioned(
                        top: padding.top + 100,
                        child: Container(
                          width: widget.multiSideEntity.titleImage.width.w,
                          height: widget.multiSideEntity.titleImage.height.w,
                          child: FadeInImage(
                            placeholder: MemoryImage(kTransparentImage),
                            image: ImageUtils.getImageProvider(
                                widget.multiSideEntity.titleImage.img),
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                    : SizedBox(),
                widget.multiSideEntity.sideEntities != null
                    ? Container(
                        width: size.width,
                        height: size.height,
                        child: PageView.builder(
                          controller: _verticalController,
                          physics: Provider.of<SideState>(context).isScale ||
                                  widget.multiSideEntity.sideEntities.length ==
                                      1
                              ? NeverScrollableScrollPhysics()
                              : AlwaysScrollableScrollPhysics(),
                          reverse: true,
                          onPageChanged: (index) {
                            setState(() {
                              _sideIndex = index;
                            });
                          },
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            return SidePage(
                              sideEntity:
                                  widget.multiSideEntity.sideEntities[index],
                              pageIndex: widget.pageIndex,
                              index: widget.index,
                            );
                          },
                          //条目个数
                          itemCount: widget.multiSideEntity.sideEntities.length,
                        ),
                      )
                    : SizedBox(),
              ],
            )
          : null,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
