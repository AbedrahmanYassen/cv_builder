import 'package:cv_builder/models/education.dart';
import 'package:cv_builder/models/experience.dart';
import 'package:cv_builder/models/skill.dart';
import 'package:cv_builder/models/user_data.dart';
import 'package:cv_builder/routes/add_info.dart';
import 'package:flutter/foundation.dart';

class UserDataHandlersProvider with ChangeNotifier {
  UserDataHandlers userDataHandlers = UserDataHandlers();

  void singleValueDataHandler(UserData data) {
    userDataHandlers
      ..nameHandler = (value) {
        data.name = value;
      }
      ..cityHandler = (value) {
        data.city = value;
      }
      ..countryHandler = (value) {
        data.country = value;
      }
      ..emailHandler = (value) {
        data.country = value;
      }
      ..phoneNumberHandler = (value) {
        data.phoneNumber = value;
      }
      ..streetHandler = (value) {
        data.street = value;
      }
      ..currentPositionHandler = (value) {
        data.currentPosition = value;
      };
  }

  void experienceHandler(ExperienceHandler experienceHandler, int index,
      int lengthOfExperiences, Experience data) {
    experienceHandler
      ..companyName = (value) {
        data.companyName = value;
      }
      ..companyLocation = (value) {
        data.companyLocation = value;
      }
      ..period = (value) {
        data.period = value;
      }
      ..jopTitle = (value) {
        data.jobTitle = value;
      }
      ..details = (value) {
        data.details = value;
      };
  }

  void educationHandler(EducationHandler educationHandler, int index,
      int lengthOfExperiences, Education data) {
    educationHandler
      ..schoolName = (value) {
        data.schoolName = value;
      }
      ..details = (value) {
        data.details = value;
      }
      ..period = (value) {
        data.details = value;
      }
      ..degree = (value) {
        data.degree = value;
      }
      ..major = (value) {
        data.major = value;
      }
      ..location = (value) {
        data.location = value;
      };
  }

  void setState() {
    notifyListeners();
  }
}

class ExperienceHandler {
  late Function(String) companyName;

  late Function(String) jopTitle;

  late Function(String) period;

  late Function(String) details;

  late Function(String) companyLocation;
}

class EducationHandler {
  late Function(String) schoolName;

  late Function(String) location;

  late Function(String) degree;
  late Function(String) major;
  late Function(String) period;

  late Function(String) details;
}

class UserDataHandlers {
  Function(String) nameHandler = (value) {};

  Function(String) cityHandler = (value) {};

  Function(String) streetHandler = (value) {};

  Function(String) phoneNumberHandler = (value) {};

  Function(String) countryHandler = (value) {};

  Function(String) emailHandler = (value) {};

  List<ExperienceHandler> experiencesHandler = [];

  Function(String) degreesHandler = (value) {};

  Function(String) skillsHandler = (value) {};

  Function(String) awardsHandler = (value) {};

  Function(String) languagesHandler = (value) {};

  Function(String) currentPositionHandler = (value) {};
}
