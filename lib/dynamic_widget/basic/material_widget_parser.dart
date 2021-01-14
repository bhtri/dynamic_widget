import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';

class MaterialWidgetParser extends WidgetParser {
  @override
  Map<String, dynamic> export(Widget widget, BuildContext buildContext) {
    var realWidget = widget as Material;

    return <String, dynamic>{
      "type": widgetName,
      "color": realWidget.color == null
          ? null
          : realWidget.color.value.toRadixString(16),
      "shadowColor": realWidget.shadowColor == null
          ? null
          : realWidget.shadowColor.value.toRadixString(16),
      "borderOnForeground": realWidget.borderOnForeground,
      "child": realWidget.child == null
          ? null
          : DynamicWidgetBuilder.export(realWidget.child, buildContext),
      "shape": exportShapeBorder(realWidget.shape),
    };
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener listener) {
    var material = Material(
      color: map.containsKey("color") ? parseHexColor(map["color"]) : null,
      shadowColor: map.containsKey("shadowColor")
          ? parseHexColor(map["shadowColor"])
          : null,
      borderOnForeground: map.containsKey("borderOnForeground")
          ? map["borderOnForeground"] as bool
          : true,
      child: map.containsKey("child")
          ? DynamicWidgetBuilder.buildFromMap(
              map["child"], buildContext, listener)
          : null,
      shape: map.containsKey("shape") ? parseShapeBorder(map["shape"]) : null,
    );

    return material;
  }

  @override
  String get widgetName => "Material";

  @override
  Type get widgetType => Material;
}
