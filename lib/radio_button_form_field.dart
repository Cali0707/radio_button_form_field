library radio_button_form_field;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RadioButtonFormField extends FormField {
  /// Creates a [RadioButtonFormField] which extends a [FormField].
  ///
  /// When using without a Form ancestor, a [GlobalKey] is required.
  RadioButtonFormField({
    Key key,
    @required this.value,
    @required this.data,
    @required BuildContext context,
    this.mouseCursor,
    this.toggleable = false,
    this.activeColor,
    this.focusColor,
    this.hoverColor,
    this.tileColor,
    this.selectedTileColor,
    this.materialTapTargetSize,
    this.visualDensity,
    this.focusNode,
    this.autoFocus = false,
    FormFieldSetter onSaved,
    FormFieldValidator validator,
    this.inputDecoration = const InputDecoration(),
    bool autoValidate = false,
    this.titleStyle
  })  : assert(autoValidate != null),
        super(
            validator: validator,
            onSaved: onSaved,
            builder: (FormFieldState state) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return new ListTile(
                    leading: Radio(
                      value: data[index]['value'],
                      groupValue: state.value,
                      activeColor: activeColor,
                      autofocus: autoFocus,
                      focusColor: focusColor,
                      focusNode: focusNode,
                      hoverColor: hoverColor,
                      materialTapTargetSize: materialTapTargetSize,
                      mouseCursor: mouseCursor,
                      onChanged: (value) {
                        state.didChange(value);
                      },
                      toggleable: toggleable,
                      visualDensity: visualDensity,
                    ),
                    title: Text(
                      data[index]['title'],
                      style: titleStyle ?? TextStyle(color: Colors.black),
                    ),
                  );
                },
              );
            });
  final value;
  final MouseCursor mouseCursor;
  final bool toggleable;
  final Color activeColor;
  final Color focusColor;
  final Color hoverColor;
  final Color tileColor;
  final Color selectedTileColor;
  final MaterialTapTargetSize materialTapTargetSize;
  final VisualDensity visualDensity;
  final FocusNode focusNode;
  final bool autoFocus;
  final InputDecoration inputDecoration;
  final List<Map> data;
  final TextStyle titleStyle;
}
