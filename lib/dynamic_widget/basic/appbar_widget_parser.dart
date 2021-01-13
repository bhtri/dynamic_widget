import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidgetParser extends WidgetParser {
  @override
  Map<String, dynamic> export(Widget widget, BuildContext buildContext) {
    var realWidget = widget as AppBar;

    return <String, dynamic>{
      "type": widgetName,
      "centerTitle": realWidget.centerTitle,
      "backgroundColor": realWidget.backgroundColor != null
          ? realWidget.backgroundColor.value.toRadixString(16)
          : null,
      "title": realWidget.title == null
          ? null
          : DynamicWidgetBuilder.export(realWidget.title, buildContext),
      "leading": realWidget.leading == null
          ? null
          : DynamicWidgetBuilder.export(realWidget.leading, buildContext),
      "actions": realWidget.actions == null
          ? null
          : DynamicWidgetBuilder.exportWidgets(
              realWidget.actions, buildContext),
    };
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener listener) {
    Map<String, dynamic> titleMap = map["title"];
    Widget title = titleMap == null
        ? null
        : DynamicWidgetBuilder.buildFromMap(titleMap, buildContext, listener);
    Map<String, dynamic> leadingMap = map["leading"];
    Widget leading = leadingMap == null
        ? null
        : DynamicWidgetBuilder.buildFromMap(leadingMap, buildContext, listener);
    List<dynamic> actionMap = map["actions"];
    List<Widget> actions = actionMap == null
        ? null
        : DynamicWidgetBuilder.buildWidgets(actionMap, buildContext, listener);

    var appBarWidget = AppBar(
      title: title,
      leading: leading,
      actions: actions,
    );

    return appBarWidget;
  }

  @override
  String get widgetName => "AppBar";

  @override
  Type get widgetType => AppBar;
}
