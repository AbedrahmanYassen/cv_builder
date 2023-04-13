import 'package:cv_builder/models/data_fields.dart';
import 'package:cv_builder/models/education.dart';
import 'package:cv_builder/models/experience.dart';
import 'package:cv_builder/providers/show_hide_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/skill.dart';

class CompositeShowHideField extends StatelessWidget {
  CompositeShowHideField(
      {Key? key, required this.dataFields, required this.fieldValues})
      : super(key: key);

  bool isChecked = false;
  List fieldValues;
  final DataFields dataFields;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Skills"),
            Consumer<ShowHideProvider>(builder: (_, provider, __) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(fieldValues.length, (index) {
                  String currentValue = "";
                  switch (dataFields) {
                    case DataFields.skills:
                      currentValue = (fieldValues[index] as Skill).skillName;
                      break;
                    case DataFields.degrees:
                      currentValue =
                          (fieldValues[index] as Education).schoolName;
                      break;
                    case DataFields.experiences:
                      currentValue =
                          (fieldValues[index] as Experience).jobTitle;

                      break;
                    default:
                      currentValue = "";
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(currentValue),
                      Checkbox(
                        value: isChecked,
                        onChanged: (v) {
                          isChecked = v!;
                          provider.handleShowingOrHidingForCompositeFields(
                              isChecked, dataFields, fieldValues[index], index, fieldValues.length);
                        },
                      ),
                    ],
                  );
                }),
              );
            })
          ],
        ),
      ),
    );
  }
}
