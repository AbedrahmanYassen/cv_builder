import 'package:cv_builder/models/education.dart';

import 'experience.dart';

class UserData {
  String name;
  String currentPosition;
  String city;
  String street;
  String phoneNumber;
  String email;
  List<Experience> experiences ;
  List<String> skills ;
  List<Education> degrees;

  UserData({
      required this.name,
      this.currentPosition="",
      this.city="",
      this.street="",
      required this.phoneNumber,
      required this.email,
      required this.experiences,
      required this.skills,
      required this.degrees});
}
