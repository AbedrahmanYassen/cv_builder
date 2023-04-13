// import 'dart:io';
// import 'dart:typed_data';
//
// import 'package:cv_builder/models/education.dart';
// import 'package:cv_builder/models/experience.dart';
// import 'package:cv_builder/models/user_data.dart';
// import 'package:cv_builder/services/cv_generator.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_test/flutter_test.dart';
// void main(){
//   WidgetsFlutterBinding.ensureInitialized();
//   test("check the generation status of CV", ()async{
//     // setup
//     CVGenerator cvgenerator = CVGenerator(
//       UserData(
//         name: "test",
//         phoneNumber: "0597501896",
//         email: "abdrhman9@gmail.com",
//         experiences: [
//           Experience(
//             jobTitle: "Flutter developer",
//             details:
//             "I worked at X company on an application called Y, and I helped building the user interfaces of the application",
//           ),
//           Experience(
//             jobTitle: "Web developer",
//             details:
//             "I worked at Z company on building APIs for their product, and many back-end related tasks",
//           ),
//         ],
//         skills: ["Flutter", "machine learning" , "English language"],
//         degrees: [
//           Education(
//               "Islamic university",
//               "location",
//               "",
//               "Computer Engineering",
//               "",
//               "At 2024 I finished my degree with X GPA"),
//           Education(
//               "Waterloo",
//               "location",
//               "",
//               "Master in Computer Science",
//               "",
//               "At 2024 I finished my degree with X GPA")
//         ],
//       ),
//     );
//
//     // do
//     Uint8List result =
//     await cvgenerator.generateResume(cvgenerator.data);
//     File file = File("generated_cvs/example_${cvgenerator.data.name.replaceAll(" ", "")}.pdf");
//     file.writeAsBytes(result);
//     final bool isExist = await file.exists();
//
//     // test
//     expect(isExist, true);
//
//   });
// }