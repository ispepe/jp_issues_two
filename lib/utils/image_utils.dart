/*
 * Copyright (c) 2020 Jing Pei Technology Co., Ltd. All rights reserved.
 * See LICENSE for distribution and usage details.
 *
 * https://jingpei.tech
 * https://jin.dev
 *
 * Created by Angus
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:common_utils/common_utils.dart';

class ImageUtils {
  static ImageProvider getAssetImage(String name,
      {ImageFormat format = ImageFormat.png}) {
    return AssetImage(getImgPath(name, format: format));
  }

  static String getImgPath(String name,
      {ImageFormat format = ImageFormat.png}) {
    if (name.endsWith('.jpg')) {
      return 'assets/images/$name';
    } else if (name.endsWith('.png')) {
      return 'assets/images/$name';
    }

    return 'assets/images/$name.${format.value}';
  }

  /// TODO: 9/7/20 待处理 封装阿里云样式，根据当前屏幕像素密度确定样式
  static ImageProvider getImageProvider(String imageUrl,
      {String holderImg = 'none'}) {
    if (TextUtil.isEmpty(imageUrl)) {
      return AssetImage(getImgPath(holderImg));
    } else if (!imageUrl.contains('https')) {
      return getAssetImage(imageUrl);
    }

    return CachedNetworkImageProvider(Uri.parse(imageUrl).toString(),
        imageRenderMethodForWeb: ImageRenderMethodForWeb.HttpGet);
  }
}

enum ImageFormat { png, jpg, gif, webp }

extension ImageFormatExtension on ImageFormat {
  String get value => ['png', 'jpg', 'gif', 'webp'][index];
}
