import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

// final fontFamily = 'NotoSansSC';

// 文本样式
TextTheme _buildTextTheme(TextTheme base, {double size = 30.0}) {
  return base.copyWith(
    headline6: base.headline6.copyWith(fontSize: 18.0),
    bodyText1: base.bodyText1.copyWith(
        fontSize: 12.0, color: Color(0xff333333), fontWeight: FontWeight.w400),
    bodyText2: base.bodyText2.copyWith(
        fontSize: 12.0, color: Color(0xff333333), fontWeight: FontWeight.w400),
  );
}

// 主题色
TextTheme _buildPrimaryTextTheme(TextTheme base, {double size = 30.0}) {
  return base.copyWith(
    bodyText1: base.bodyText1
        .copyWith(color: Color(0xff333333), fontWeight: FontWeight.w400),
    bodyText2: base.bodyText2.copyWith(
        color: Color(0xff333333), fontSize: 14.0, fontWeight: FontWeight.w400),
  );
}

// 输入框颜色
InputDecorationTheme _buildInputTheme(
  InputDecorationTheme theme, {
  TextStyle labelStyle,
  TextStyle hintStyle,
  InputBorder focusedBorder,
  InputBorder disabledBorder,
  InputBorder enabledBorder,
  InputBorder border,
}) {
  return InputDecorationTheme(
    labelStyle: labelStyle ?? theme.labelStyle,
    helperStyle: theme.helperStyle,
    hintStyle: hintStyle ?? theme.hintStyle,
    errorStyle: theme.errorStyle,
    errorMaxLines: theme.errorMaxLines,
    floatingLabelBehavior: theme.floatingLabelBehavior,
    isDense: theme.isDense,
    contentPadding: theme.contentPadding,
    prefixStyle: theme.prefixStyle,
    suffixStyle: theme.suffixStyle,
    counterStyle: theme.counterStyle,
    filled: theme.filled,
    fillColor: theme.fillColor,
    errorBorder: theme.errorBorder,
    focusedBorder: focusedBorder ?? theme.focusedBorder,
    focusedErrorBorder: theme.focusedErrorBorder,
    disabledBorder: disabledBorder ?? theme.disabledBorder,
    enabledBorder: enabledBorder ?? theme.enabledBorder,
    border: border ?? theme.border,
  );
}

class NoTransitionsOnWeb extends PageTransitionsTheme {
  @override
  Widget buildTransitions<T>(
    route,
    context,
    animation,
    secondaryAnimation,
    child,
  ) {
    if (kIsWeb) {
      return child;
    }
    return super.buildTransitions(
      route,
      context,
      animation,
      secondaryAnimation,
      child,
    );
  }
}

// 主题
ThemeData themeData() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    /// NOTE: 9/4/20 待注意 WEB端统一去掉切换动画
    pageTransitionsTheme: NoTransitionsOnWeb(),

    /// 开启视觉密度适应
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
//    toggleableActiveColor: Color(0xFF1759D7),
    backgroundColor: Colors.black54,
    dialogBackgroundColor: const Color(0xfff5f5f5),
    scaffoldBackgroundColor: const Color(0xffffffff),
    primaryColor: Color.fromRGBO(240, 206, 148, 1),
    accentColor: Color.fromRGBO(240, 206, 148, 1),
//    primaryColorLight: const Color(0xFF1759D7),
//    primaryColorDark: const Color(0xFF1759D7),
    bottomAppBarColor: const Color(0xfffffffff),
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    iconTheme: base.iconTheme.copyWith(color: Color(0xFF9E9E9E)),
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: Colors.white,
      brightness: Brightness.light,
      iconTheme: base.iconTheme.copyWith(color: Color(0xff333333)),
      textTheme: TextTheme(
        headline6: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: Color(0xff333333)),
      ),
    ),
//    canvasColor: const Color(0xffffff00),
    canvasColor: Colors.transparent,
    dividerColor: const Color(0xffe0e0e0),
    cardColor: Color(0xffffffff),
    // popMenu的颜色
    inputDecorationTheme: _buildInputTheme(base.inputDecorationTheme,
        labelStyle: TextStyle(fontSize: 14.0),
        hintStyle: TextStyle(
            color: Color(0xffc8cad8),
            fontWeight: FontWeight.w400,
            fontSize: 14.0),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffc6ced7))),
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffc6ced7)))),
    textTheme: _buildTextTheme(base.textTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
    primaryTextTheme: _buildPrimaryTextTheme(base.primaryTextTheme),
  );
}
