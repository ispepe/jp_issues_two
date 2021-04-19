import 'package:bin_jiang_yi_hao/models/page_entity.dart';
import 'package:bin_jiang_yi_hao/models/side_entity.dart';

pageEntityFromJson(PageEntity data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type'].toString();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['bg_image'] != null) {
		data.bgImage = json['bg_image'].toString();
	}
	if (json['width'] != null) {
		data.width = json['width'] is String
				? double.tryParse(json['width'])
				: json['width'].toDouble();
	}
	if (json['height'] != null) {
		data.height = json['height'] is String
				? double.tryParse(json['height'])
				: json['height'].toDouble();
	}
	if (json['title_image'] != null) {
		data.titleImage = SideTitleImage().fromJson(json['title_image']);
	}
	if (json['side_entities'] != null) {
		data.sideEntities = (json['side_entities'] as List).map((v) => SideEntity().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> pageEntityToJson(PageEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	data['title'] = entity.title;
	data['bg_image'] = entity.bgImage;
	data['width'] = entity.width;
	data['height'] = entity.height;
	data['title_image'] = entity.titleImage?.toJson();
	data['side_entities'] =  entity.sideEntities?.map((v) => v.toJson())?.toList();
	return data;
}

sideTitleImageFromJson(SideTitleImage data, Map<String, dynamic> json) {
	if (json['img'] != null) {
		data.img = json['img'].toString();
	}
	if (json['width'] != null) {
		data.width = json['width'] is String
				? double.tryParse(json['width'])
				: json['width'].toDouble();
	}
	if (json['height'] != null) {
		data.height = json['height'] is String
				? double.tryParse(json['height'])
				: json['height'].toDouble();
	}
	return data;
}

Map<String, dynamic> sideTitleImageToJson(SideTitleImage entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['img'] = entity.img;
	data['width'] = entity.width;
	data['height'] = entity.height;
	return data;
}