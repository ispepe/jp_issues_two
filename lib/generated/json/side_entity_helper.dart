import 'package:bin_jiang_yi_hao/models/side_entity.dart';

sideEntityFromJson(SideEntity data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type'].toString();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['bg'] != null) {
		data.bg = json['bg'].toString();
	}
	if (json['bg_images'] != null) {
		data.bgImages = (json['bg_images'] as List).map((v) => SideBgImage().fromJson(v)).toList();
	}
	if (json['frames'] != null) {
		data.frames = (json['frames'] as List).map((v) => v.toString()).toList().cast<String>();
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

Map<String, dynamic> sideEntityToJson(SideEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	data['title'] = entity.title;
	data['bg'] = entity.bg;
	data['bg_images'] =  entity.bgImages?.map((v) => v.toJson())?.toList();
	data['frames'] = entity.frames;
	data['width'] = entity.width;
	data['height'] = entity.height;
	return data;
}

sideBgImageFromJson(SideBgImage data, Map<String, dynamic> json) {
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

Map<String, dynamic> sideBgImageToJson(SideBgImage entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['img'] = entity.img;
	data['width'] = entity.width;
	data['height'] = entity.height;
	return data;
}