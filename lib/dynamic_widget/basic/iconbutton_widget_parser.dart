import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';

class IconButtonWidgetParser extends WidgetParser {
  @override
  Map<String, dynamic> export(Widget widget, BuildContext buildContext) {
    var realWidget = widget as IconButton;
    var padding = realWidget.padding as EdgeInsets;

    return <String, dynamic>{
      "type": widgetName,
      "icon": realWidget.icon != null
          ? DynamicWidgetBuilder.export(realWidget.icon, buildContext)
          : null,
      "iconSize": realWidget.iconSize,
      "padding": padding != null
          ? "${padding.left},${padding.top},${padding.right},${padding.bottom}"
          : null,
      "alignment": realWidget.alignment != null
          ? exportAlignment(realWidget.alignment)
          : null,
      "splashRadius": realWidget.splashRadius,
      "color": realWidget.color != null
          ? realWidget.color.value.toRadixString(16)
          : null,
      "focusColor": realWidget.focusColor != null
          ? realWidget.focusColor.value.toRadixString(16)
          : null,
      "hoverColor": realWidget.hoverColor != null
          ? realWidget.hoverColor.value.toRadixString(16)
          : null,
      "highlightColor": realWidget.highlightColor != null
          ? realWidget.highlightColor.value.toRadixString(16)
          : null,
      "splashColor": realWidget.splashColor != null
          ? realWidget.splashColor.value.toRadixString(16)
          : null,
      "disabledColor": realWidget.splashColor != null
          ? realWidget.splashColor.value.toRadixString(16)
          : null,
      "autofocus": realWidget.autofocus,
      "tooltip": realWidget.tooltip,
      "enableFeedback": realWidget.enableFeedback,
    };
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener listener) {
    String clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";

    var iconButton = IconButton(
      icon: map["icon"]
          ? DynamicWidgetBuilder.buildFromMap(
              map["icon"], buildContext, listener)
          : null,
      onPressed: () {
        listener.onClicked(clickEvent);
      },
      iconSize: map["iconSize"]?.toDouble(),
      padding: map.containsKey('padding')
          ? parseEdgeInsetsGeometry(map['padding'])
          : EdgeInsets.all(8.0),
      alignment: map.containsKey("alignment")
          ? parseAlignment(map['alignment'])
          : Alignment.center,
      splashRadius: map["splashRadius"]?.toDouble(),
      color: map["color"] ? parseHexColor(map["color"]) : null,
      focusColor: map["focusColor"] ? parseHexColor(map["focusColor"]) : null,
      hoverColor: map["hoverColor"] ? parseHexColor(map["hoverColor"]) : null,
      highlightColor:
          map["highlightColor"] ? parseHexColor(map["highlightColor"]) : null,
      splashColor:
          map["splashColor"] ? parseHexColor(map["splashColor"]) : null,
      disabledColor:
          map["disabledColor"] ? parseHexColor(map["disabledColor"]) : null,
      autofocus:
          map.containsKey("autofocus") ? map["autofocus"] as bool : false,
      tooltip: map["tooltip"].toString(),
      enableFeedback: map.containsKey("enableFeedback")
          ? map["enableFeedback"] as bool
          : true,
    );

    return iconButton;
  }

  @override
  String get widgetName => "IconButton";

  @override
  Type get widgetType => IconButton;
}
