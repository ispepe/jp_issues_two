import 'package:bin_jiang_yi_hao/generated/json/base/json_convert_content.dart';
import 'package:bin_jiang_yi_hao/generated/json/base/json_field.dart';
import 'package:bin_jiang_yi_hao/models/side_entity.dart';

class PageEntity with JsonConvert<PageEntity> {
  String type;
  String title;

  @JSONField(name: "bg_image")
  String bgImage;

  double width;
  double height;

  /// 用于显示的标题图片
  @JSONField(name: "title_image")
  SideTitleImage titleImage;

  /// 多个实体类型
  @JSONField(name: "side_entities")
  List<SideEntity> sideEntities;
}

class SideTitleImage with JsonConvert<SideTitleImage> {
  String img;
  double width;
  double height;
}
