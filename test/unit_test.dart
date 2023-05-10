import 'dart:io';
import 'dart:typed_data';

import 'package:cv_builder/models/data_fields.dart';
import 'package:cv_builder/models/education.dart';
import 'package:cv_builder/models/experience.dart';
import 'package:cv_builder/models/skill.dart';
import 'package:cv_builder/models/user_data.dart';
import 'package:cv_builder/providers/show_hide_provider.dart';
import 'package:cv_builder/services/cv_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  test("Show hide provider single field data ", () async {
    ShowHideProvider showHideProvider = ShowHideProvider();
    showHideProvider.handleShowingOrHiding(true, DataFields.name, "John");
    expect(showHideProvider.userData.name, "John");
    showHideProvider.handleShowingOrHiding(
        false, DataFields.email, "example@gmail.com");
    expect(showHideProvider.userData.email, "");
  });

  test("show hide provider for composite field data", () {
    ShowHideProvider showHideProvider = ShowHideProvider();
    showHideProvider.handleShowingOrHidingForCompositeFields(true, DataFields.skills, Skill()..skillName = "Flutter dev" , 0 , 1 );
    expect(showHideProvider.userData.skills[0].skillName, "Flutter dev");

  });
}
