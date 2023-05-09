import 'dart:io';
import 'dart:typed_data';

import 'package:cv_builder/models/education.dart';
import 'package:cv_builder/models/experience.dart';
import 'package:cv_builder/models/user_data.dart';
import 'package:cv_builder/services/cv_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  test("check the generation status of CV", ()async{
    // setup
    CVGenerator cvgenerator = CVGenerator(
      
    );

    // do
    // Uint8List result =
    // await cvgenerator.generateResume();
    // File file = File("generated_cvs/example_${cvgenerator.data.name.replaceAll(" ", "")}.pdf");
    // file.writeAsBytes(result);
    // final bool isExist = await file.exists();

    // test
    // expect(isExist, true);
    
    

  });
  test("description", () => null)
}