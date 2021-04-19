import 'package:bin_jiang_yi_hao/generated/json/base/json_convert_content.dart';
import 'package:bin_jiang_yi_hao/generated/json/base/json_field.dart';

class SideEntity with JsonConvert<SideEntity> {
  String type;
  String title;
  String bg;

  //// 扩展images
  /// List<String> images = [];
  @JSONField(name: "bg_images")
  List<SideBgImage> bgImages = [];

  /// 新增帧数和每帧的热点数据
  List<String> frames;

  /// 图片大小
  double width;
  double height;
}

class SideBgImage with JsonConvert<SideBgImage> {
  String img;
  double width;
  double height;
}
