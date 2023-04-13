import 'dart:ffi';

import 'package:cv_builder/models/data_fields.dart';
import 'package:cv_builder/providers/show_hide_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleValueShowHideField extends StatefulWidget {
  const SingleValueShowHideField(
      {Key? key, required this.fieldValue, required this.dataFields})
      : super(key: key);
  final String fieldValue;

  final DataFields dataFields;

  @override
  State<SingleValueShowHideField> createState() =>
      _SingleValueShowHideFieldState();
}

class _SingleValueShowHideFieldState extends State<SingleValueShowHideField> {
  bool isChecked = false;

  late String fieldKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.black12),
        child: Consumer<ShowHideProvider>(builder: (_, provider, __) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.fieldValue),
              Checkbox(
                value: isChecked,
                onChanged: (value) {
                  isChecked = value!;
                  provider.handleShowingOrHiding(
                    isChecked,
                    widget.dataFields,
                    widget.fieldValue,
                  );
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
