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
    @required this.title,
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
  }) : assert(autoValidate != null),
  super(
        validator: validator,
        onSaved: onSaved,
        builder: (FormFieldState state) {
          return InputDecorator(
            decoration: inputDecoration,
            child: ListTile(
              title: title,
              leading: Radio(
                value: value,
                groupValue: state.value,
                onChanged: (value) {
                  state.didChange(value);
                },
                mouseCursor: mouseCursor,
                toggleable: toggleable,
                activeColor: activeColor,
                focusColor: focusColor,
                hoverColor: hoverColor,
                materialTapTargetSize: materialTapTargetSize,
              ),
            ),
          );
        }
      );
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
  final Text title;
  final InputDecoration inputDecoration;
}