import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';

class TextFieldWidgetParser extends WidgetParser {
  @override
  Map<String, dynamic> export(Widget widget, BuildContext buildContext) {
    var realWidget = widget as TextField;

    return <String, dynamic>{
      "type": widgetName,
      "decoration": realWidget.decoration != null
          ? exportInputDecoration(realWidget.decoration, buildContext)
          : null,
      "keyboardType": exportTextInputType(realWidget.keyboardType),
      "style":
          realWidget.style != null ? exportTextStyle(realWidget.style) : null,
      "textAlign": exportTextAlign(realWidget.textAlign),
      "textDirection": realWidget.textDirection != null
          ? exportTextDirection(realWidget.textDirection)
          : null,
      "readOnly": realWidget.readOnly,
      "showCursor":
          realWidget.showCursor != null ? realWidget.showCursor : null,
      "autofocus": realWidget.autofocus,
      "obscuringCharacter": realWidget.obscuringCharacter,
      "obscureText": realWidget.obscureText,
      "autocorrect": realWidget.autocorrect,
      "enableSuggestions": realWidget.enableSuggestions,
      "maxLines": realWidget.maxLines,
      "minLines": realWidget.minLines != null ? realWidget.minLines : null,
      "expands": realWidget.expands,
      "maxLength": realWidget.maxLength != null ? realWidget.maxLength : null,
      "maxLengthEnforced": realWidget.maxLengthEnforced,
      "enabled": realWidget.enabled != null ? realWidget.enabled : null,
      "cursorWidth": realWidget.cursorWidth,
      "cursorHeight":
          realWidget.cursorHeight != null ? realWidget.cursorHeight : null,
      "cursorColor": realWidget.cursorColor != null
          ? realWidget.cursorColor.value.toRadixString(16)
          : null,
      "enableInteractiveSelection": realWidget.enableInteractiveSelection,
    };
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener listener) {
    Map<String, dynamic> decorationMap = map["decoration"];
    InputDecoration decoration = decorationMap == null
        ? null
        : parseInputDecoration(decorationMap, buildContext, listener);

    var textField = TextField(
      decoration: decoration,
      keyboardType: parseTextInputType(map["keyboardType"]),
      style: map["style"] ? parseTextStyle(map["style"]) : null,
      textAlign: map["textAlign"] ? parseTextAlign(map["textAlign"]) : null,
      textDirection: map["textDirection"]
          ? parseTextDirection(map["textDirection"])
          : null,
      readOnly: map["readOnly"] ? map["readOnly"] as bool : false,
      showCursor: map["showCursor"] ? map["showCursor"] as bool : null,
      autofocus: map["autofocus"] ? map["autofocus"] as bool : false,
      obscuringCharacter: map["obscuringCharacter"]?.toString(),
      obscureText: map["obscureText"] ? map["obscureText"] as bool : false,
      autocorrect: map["autocorrect"] ? map["autocorrect"] as bool : true,
      enableSuggestions:
          map["enableSuggestions"] ? map["enableSuggestions"] as bool : true,
      maxLines: map["maxLines"] ? map["maxLines"]?.toInt() : 1,
      minLines: map["minLines"] ? map["minLines"]?.toInt() : null,
      expands: map["expands"] ? map["expands"] as bool : false,
      maxLength: map["maxLength"] ? map["maxLength"]?.toInt() : null,
      maxLengthEnforced:
          map["maxLengthEnforced"] ? map["maxLengthEnforced"] as bool : true,
      enabled: map["enabled"] ? map["enabled"] as bool : null,
      cursorWidth: map["cursorWidth"] ? map["cursorWidth"]?.toDouble() : 2.0,
      cursorHeight:
          map["cursorHeight"] ? map["cursorHeight"]?.toDouble() : null,
      cursorColor:
          map["cursorColor"] ? parseHexColor(map["cursorColor"]) : null,
      enableInteractiveSelection: map["enableInteractiveSelection"]
          ? map["enableInteractiveSelection"] as bool
          : true,
    );

    return textField;
  }

  @override
  String get widgetName => "TextField";

  @override
  Type get widgetType => TextField;
}
