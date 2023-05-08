import 'dart:io';
import 'dart:typed_data';

import 'package:cv_builder/models/data_fields.dart';
import 'package:cv_builder/models/education.dart';
import 'package:cv_builder/models/experience.dart';
import 'package:cv_builder/models/user_data.dart';
import 'package:cv_builder/services/cv_generator.dart';
import 'package:flutter/cupertino.dart';

import '../models/skill.dart';

class ShowHideProvider with ChangeNotifier {
  UserData userData = UserData(

  );

  void handleShowingOrHiding(
      bool isChecked, DataFields dataFields, String value) {
    if (value.isNotEmpty) {
      if (isChecked) {
        switch (dataFields) {
          case DataFields.name:
            userData.name = value;
            break;
          case DataFields.phoneNumber:
            userData.phoneNumber = value;
            break;
          case DataFields.city:
            userData.city = value;
            break;
          case DataFields.email:
            userData.email = value;
            break;
          case DataFields.currentPosition:
            userData.currentPosition = value;
            break;
          case DataFields.street:
            userData.street = value;
            break;

          default:
            userData = userData;
        }
      } else {
        switch (dataFields) {
          case DataFields.name:
            userData.name = "";
            break;
          case DataFields.phoneNumber:
            userData.phoneNumber = "";
            break;
          case DataFields.city:
            userData.city = "";
            break;
          case DataFields.currentPosition:
            userData.currentPosition = "";
            break;
          case DataFields.email:
            userData.email = "";
            break;
          case DataFields.street:
            userData.street = "";
            break;
          default:
            userData = userData;
        }
      }
    }
    notifyListeners();
  }

  void handleShowingOrHidingForCompositeFields(
      bool isChecked, DataFields dataFields, value, int index, int length) {
    if (length != 0) {
      if (isChecked) {
        switch (dataFields) {
          case DataFields.degrees:
            userData.degrees.add( value as Education);
            break;
          case DataFields.experiences:
            userData.experiences.add(value as Experience);
            break;
          case DataFields.skills:
            userData.skills.add(value as Skill);
            break;
          default:
            userData = userData;
        }
      } else {
        switch (dataFields) {
          case DataFields.skills:
            userData.skills.clear();
            break;
          case DataFields.degrees:
            userData.degrees.clear();
            break;
          case DataFields.experiences:
            userData.experiences.clear();
            break;
          default:
            userData = userData;
        }
      }
    }
    notifyListeners();
  }

  UserData getData() {
    return userData;
  }

  Future<void> resumeGenerator() async {
    CVGenerator cvGenerator = CVGenerator();
    Uint8List result = await cvGenerator.generateGoogleDocsLikeResume(userData);
    File file = File("example.pdf");
    file.writeAsBytes(result);
  }
}
