import 'package:cv_builder/models/education.dart';
import 'package:cv_builder/models/skill.dart';

import 'award.dart';
import 'experience.dart';

class UserData {
  String name = "";

  String currentPosition = "";
  String city = "";
  String street = "";
  String phoneNumber = "";
  String email = "";
  List<Experience> experiences = [];
  List<Skill> skills = [];
  List<Education> degrees = [];
  List<String> languages = [];
  List<String> awards = [];

  String country = "";
}
