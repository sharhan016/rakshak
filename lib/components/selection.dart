import 'package:flutter/material.dart';

class SelectionComponent extends StatelessWidget {
  final String title;
  final bool value;
  final Function onChanged;

  SelectionComponent({
    @required this.title,
    @required this.value,
    @required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }
}
