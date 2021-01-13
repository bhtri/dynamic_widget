import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScaffoldWidgetParser extends WidgetParser {
  @override
  Map<String, dynamic> export(Widget widget, BuildContext buildContext) {
    var realWidget = widget as Scaffold;

    return <String, dynamic>{
      "type": widgetName,
      "body": DynamicWidgetBuilder.export(realWidget.body, buildContext),
      "appBar": DynamicWidgetBuilder.export(realWidget.appBar, buildContext),
    };
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener listener) {
    Map<String, dynamic> bodyMap = map["body"];
    Widget body = bodyMap == null
        ? null
        : DynamicWidgetBuilder.buildFromMap(bodyMap, buildContext, listener);
    Map<String, dynamic> appBarMap = map["appBar"];
    Widget appBar = appBarMap == null
        ? null
        : DynamicWidgetBuilder.buildFromMap(appBarMap, buildContext, listener);

    var scaffoldWidget = Scaffold(
      appBar: appBar,
      body: body,
    );

    return scaffoldWidget;
  }

  @override
  String get widgetName => "Scaffold";

  @override
  Type get widgetType => Scaffold;
}
