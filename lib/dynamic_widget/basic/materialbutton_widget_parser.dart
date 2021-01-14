import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';

class MaterialButtonParser extends WidgetParser {
  @override
  Map<String, dynamic> export(Widget widget, BuildContext buildContext) {
    var realWidget = widget as MaterialButton;
    var padding = realWidget.padding as EdgeInsets;

    return <String, dynamic>{
      "type": widgetName,
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext),
      "autofocus": realWidget.autofocus,
      "color": realWidget.color != null
          ? realWidget.color.value.toRadixString(16)
          : null,
      "disabledColor": realWidget.disabledColor != null
          ? realWidget.disabledColor.value.toRadixString(16)
          : null,
      "disabledElevation": realWidget.disabledElevation,
      "disabledTextColor": realWidget.disabledTextColor != null
          ? realWidget.disabledTextColor.value.toRadixString(16)
          : null,
      "elevation": realWidget.elevation,
      "focusColor": realWidget.focusColor != null
          ? realWidget.focusColor.value.toRadixString(16)
          : null,
      "focusElevation": realWidget.focusElevation,
      "height": realWidget.height,
      "highlightColor": realWidget.highlightColor != null
          ? realWidget.highlightColor.value.toRadixString(16)
          : null,
      "highlightElevation": realWidget.highlightElevation,
      "hoverColor": realWidget.hoverColor != null
          ? realWidget.hoverColor.value.toRadixString(16)
          : null,
      "hoverElevation": realWidget.hoverElevation,
      "minWidth": realWidget.minWidth,
      "shape": exportShapeBorder(realWidget.shape),
      "splashColor": realWidget.splashColor != null
          ? realWidget.splashColor.value.toRadixString(16)
          : null,
      "textColor": realWidget.textColor != null
          ? realWidget.textColor.value.toRadixString(16)
          : null,
      "padding": padding != null
          ? "${padding.left},${padding.top},${padding.right},${padding.bottom}"
          : null,
    };
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener listener) {
    String clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";

    var materialButton = MaterialButton(
      onPressed: () {
        listener.onClicked(clickEvent);
      },
      child: map.containsKey("child")
          ? DynamicWidgetBuilder.buildFromMap(
              map["child"], buildContext, listener)
          : null,
      autofocus:
          map.containsKey("autofocus") ? map["autofocus"] as bool : false,
      color: map.containsKey("color") ? parseHexColor(map["color"]) : null,
      disabledColor: map.containsKey("disabledColor")
          ? parseHexColor(map["disabledColor"])
          : null,
      disabledElevation: map['disabledElevation']?.toDouble(),
      disabledTextColor: map.containsKey("disabledTextColor")
          ? parseHexColor(map["disabledTextColor"])
          : null,
      elevation: map["elevation"]?.toDouble(),
      focusColor: map.containsKey("focusColor")
          ? parseHexColor(map["focusColor"])
          : null,
      focusElevation: map["focusElevation"]?.toDouble(),
      height: map["height"]?.toDouble(),
      highlightColor: map.containsKey("highlightColor")
          ? parseHexColor(map["highlightColor"])
          : null,
      highlightElevation: map["highlightElevation"]?.toDouble(),
      hoverColor: map.containsKey("hoverColor")
          ? parseHexColor(map["hoverColor"])
          : null,
      hoverElevation: map["hoverElevation"]?.toDouble(),
      minWidth: map["minWidth"]?.toDouble(),
      shape: map.containsKey("shape") ? parseShapeBorder(map["shape"]) : null,
      splashColor: map.containsKey("splashColor")
          ? parseHexColor(map["splashColor"])
          : null,
      textColor:
          map.containsKey("textColor") ? parseHexColor(map["textColor"]) : null,
      padding: map.containsKey('padding')
          ? parseEdgeInsetsGeometry(map['padding'])
          : null,
    );

    return materialButton;
  }

  @override
  String get widgetName => "MaterialButton";

  @override
  Type get widgetType => MaterialButton;
}
