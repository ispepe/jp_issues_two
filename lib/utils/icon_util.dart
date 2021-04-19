import 'package:flutter/material.dart';

class IconUtil {
  static IconData getIconData(String name) {
    switch (name) {
      case "public":
        return Icons.public;
      case "language":
        return Icons.language;
      case "king_bed":
        return Icons.king_bed;
      case "single_bed":
        return Icons.single_bed;
      case "home":
        return Icons.home;
      case "house_siding":
        return Icons.house_siding;
      case "work":
        return Icons.work;
      case "work_outline":
        return Icons.work_outline;
      case "track_changes":
        return Icons.track_changes;
      case "pie_chart":
        return Icons.pie_chart;
      case "view_array":
        return Icons.view_array;
      case "view_carousel":
        return Icons.view_carousel;
      case "import_contacts":
        return Icons.import_contacts;
      case "menu_book":
        return Icons.menu_book;
      case "bubble_chart":
        return Icons.bubble_chart;
      case "scatter_plot":
        return Icons.scatter_plot;
      case 'slow_motion_video_outlined':
        return Icons.slow_motion_video_outlined;
      case 'slow_motion_video':
        return Icons.slow_motion_video;
      case 'speed':
        return Icons.speed;
      default:
        return Icons.public;
    }
  }
}
