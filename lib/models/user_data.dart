import 'package:cv_builder/models/education.dart';
import 'package:cv_builder/models/skill.dart';

import 'award.dart';
import 'experience.dart';

class UserData {
  String name;
  String currentPosition;
  String city;
  String street;
  String phoneNumber;
  String email;
  List<Experience> experiences;
  List<Skill> skills;
  List<Education> degrees;
  List<String> languages;
  List<Award> awards;

  String country;

  UserData(
      {required this.name,
      required this.currentPosition,
      required this.city,
      required this.street,
      required this.phoneNumber,
      required this.email,
      required this.experiences,
      required this.skills,
      required this.degrees,
      required this.languages,
      required this.awards,
      required this.country});
}
