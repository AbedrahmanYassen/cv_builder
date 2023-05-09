// import 'package:ecommerce_app_training/providers/admin_related_providers/add_screen_manager.dart';
import 'package:cv_builder/models/data_fields.dart';
import 'package:cv_builder/models/education.dart';
import 'package:cv_builder/models/experience.dart';
import 'package:cv_builder/models/user_data.dart';
import 'package:cv_builder/providers/add_screen_provider.dart';
import 'package:cv_builder/providers/user_data_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../models/skill.dart';

class AddScreen extends StatelessWidget {
  AddScreen({Key? key}) : super(key: key);

  UserData data = UserData();

  @override
  Widget build(BuildContext context) {
    //TODO: Get the data before continuing
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AddScreenProvider()),
        ChangeNotifierProvider(create: (_) => UserDataHandlersProvider()),
      ],
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child:
                Consumer<UserDataHandlersProvider>(builder: (_, provider, __) {
              provider.singleValueDataHandler(data);

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 50, bottom: 50),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      // height: MediaQuery.of(context).size.height * 1.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.grey.shade200),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Fill your Information",
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.w700),
                          ),
                          if (kDebugMode)
                            Column(
                              children: List.generate(
                                data.experiences.length,
                                (index) => Container(
                                  color: Colors.black,
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    children: [
                                      Text(
                                        data.experiences[index].companyName,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      Text(
                                        data.experiences[index].jobTitle,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      Text(
                                        data.experiences.length.toString(),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          TextFieldForAddScreen(
                            hintText: (data.name == "") ? "Name" : data.name,
                            height: 50,
                            handler: provider.userDataHandlers.nameHandler,
                          ),
                          TextFieldForAddScreen(
                            hintText: 'Phone number',
                            height: 50,
                            // textEditingController: priceController,
                            handler:
                                provider.userDataHandlers.phoneNumberHandler,
                          ),
                          TextFieldForAddScreen(
                            hintText: 'Email',
                            height: 50,
                            handler: provider.userDataHandlers.emailHandler,
                          ),
                          TextFieldForAddScreen(
                            hintText: 'Country',
                            height: 50,
                            handler: provider.userDataHandlers.countryHandler,
                          ),
                          TextFieldForAddScreen(
                              handler: provider.userDataHandlers.cityHandler,
                              height: 50,
                              hintText: 'City'),
                          TextFieldForAddScreen(
                              handler: provider
                                  .userDataHandlers.currentPositionHandler,
                              height: 50,
                              hintText: 'Current position'),
                          const SizedBox(
                            height: 20,
                          ),
                          MultiInputDataForms(
                            listOfItems: List.generate(
                              data.experiences.length,
                              (index) => ExperienceWidget(
                                width: 200,
                                height: 40,
                                experience: data.experiences[index],
                                index: index,
                                numberOfExperiences: data.experiences.length,
                                data: data,
                              ),
                            ),
                            title: 'Experience',
                            dataFields: DataFields.experiences,
                            data: data,
                          ),
                          MultiInputDataForms(
                            listOfItems: List.generate(
                              data.degrees.length,
                              (index) => EducationWidget(
                                width: 200,
                                height: 40,
                                education: data.degrees[index],
                                data: data,
                                index: index,
                                numberOfExperiences: data.degrees.length,
                              ),
                            ),
                            title: 'Education',
                            dataFields: DataFields.degrees,
                            data: data,
                          ),
                          MultiInputDataForms(
                              listOfItems: List.generate(
                                  data.skills.length,
                                  (index) => SizedBox(
                                        height: 40,
                                        child: TextFieldForAddScreen(
                                            height: 40,
                                            hintText:
                                                data.skills[index].skillName,
                                            handler: (value) {
                                              data.skills[index].skillName =
                                                  value;
                                            }),
                                      )),
                              title: "Skills",
                              dataFields: DataFields.skills,
                              data: data),
                          MultiInputDataForms(
                              listOfItems: List.generate(
                                data.languages.length,
                                (index) => TextFieldForAddScreen(
                                  height: 40,
                                  hintText: data.languages[index],
                                  handler: (value) {
                                    data.languages[index] = value;
                                  },
                                ),
                              ),
                              title: "Languages",
                              dataFields: DataFields.languages,
                              data: data),
                          MultiInputDataForms(
                              listOfItems: List.generate(
                                data.languages.length,
                                (index) => TextFieldForAddScreen(
                                  height: 40,
                                  hintText: data.awards[index],
                                  handler: (value) {
                                    data.awards[index] = value;
                                  },
                                ),
                              ),
                              title: "Awards",
                              dataFields: DataFields.awards,
                              data: data),
                          DataUploaderToTheDatabase(
                            function: () {
                              provider.setState();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

class MultiInputDataForms extends StatelessWidget {
  final List<Widget> listOfItems;
  final String title;
  final DataFields dataFields;
  UserData data;

  MultiInputDataForms(
      {Key? key,
      required this.listOfItems,
      required this.title,
      required this.dataFields,
      required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddScreenProvider>(builder: (_, provider, __) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    late Widget defaultWidget;
                    switch (dataFields) {
                      case DataFields.experiences:
                        data.experiences.add(Experience(
                            companyName: "",
                            companyLocation: "",
                            jobTitle: "",
                            period: "",
                            details: ""));
                        defaultWidget = ExperienceWidget(
                          width: 200,
                          height: 40,
                          experience: Experience(
                              companyName: 'companyName',
                              companyLocation: 'companyLocation',
                              jobTitle: 'jobTitle',
                              period: 'period',
                              details: 'details'),
                          index: listOfItems.length,
                          numberOfExperiences: listOfItems.length,
                          data: data,
                        );

                        break;
                      case DataFields.degrees:
                        defaultWidget = EducationWidget(
                          width: 200,
                          height: 40,
                          education: Education(),
                          data: data,
                          index: listOfItems.length,
                          numberOfExperiences: listOfItems.length,
                        );
                        data.degrees.add(Education());
                        break;
                      case DataFields.skills:
                        data.skills.add(Skill());
                        defaultWidget = SizedBox(
                          height: 50,
                          width: 400,
                          child: TextFieldForAddScreen(
                              height: 40,
                              width: double.infinity,
                              hintText: "New skill",
                              handler: (value) {
                                data.skills[listOfItems.length - 1].skillName =
                                    value;
                              }),
                        );
                        break;
                      case DataFields.languages:
                        data.languages.add("");
                        defaultWidget = SizedBox(
                          height: 50,
                          width: 400,
                          child: TextFieldForAddScreen(
                              height: 40,
                              width: double.infinity,
                              hintText: "Language",
                              handler: (value) {
                                data.languages[listOfItems.length - 1] = value;
                              }),
                        );
                        break;
                      case DataFields.awards:
                        data.awards.add("");
                        defaultWidget = SizedBox(
                          height: 50,
                          width: 400,
                          child: TextFieldForAddScreen(
                              height: 40,
                              width: double.infinity,
                              hintText: "Award",
                              handler: (value) {
                                data.awards[listOfItems.length - 1] = value;
                              }),
                        );
                        break;

                      default:
                        defaultWidget = EducationWidget(
                          width: 200,
                          height: 50,
                          education: Education(),
                          data: data,
                          index: listOfItems.length,
                          numberOfExperiences: listOfItems.length,
                        );
                    }
                    provider.addWidget(defaultWidget, listOfItems);
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: listOfItems.length,
              itemBuilder: (BuildContext context, int index) {
                List<String> keys = List.generate(
                    listOfItems.length, (index) => "key$index$dataFields");
                debugPrint(keys[0]);
                return Dismissible(
                  key: Key(keys[index]),
                  onDismissed: (direction) {
                    // keys.removeAt(index);
                    switch (dataFields) {
                      case DataFields.awards:
                        data.awards.removeAt(index);
                        break;
                      case DataFields.skills:
                        data.skills.removeAt(index);
                        break;
                      case DataFields.languages:
                        data.languages.removeAt(index);
                        break;
                      case DataFields.experiences:
                        data.experiences.removeAt(index);
                        break;
                      case DataFields.degrees:
                        data.degrees.removeAt(index);
                        break;
                      default:
                        () => null;
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        listOfItems[index],

                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    });
  }
}

class ExperienceWidget extends StatelessWidget {
  Experience experience;
  double height;
  double width;
  int index;
  int numberOfExperiences;
  ExperienceHandler experienceHandler = ExperienceHandler();
  UserData data;

  ExperienceWidget(
      {Key? key,
      required this.width,
      required this.height,
      required this.experience,
      required this.index,
      required this.numberOfExperiences,
      required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserDataHandlersProvider>(builder: (_, provider, __) {
      provider.experienceHandler(experienceHandler, index, numberOfExperiences,
          data.experiences[index]);
      return Wrap(
        children: [
          TextFieldForAddScreen(
            height: height,
            width: width,
            hintText: 'Company name',
            handler: experienceHandler.companyName,
          ),
          TextFieldForAddScreen(
              height: height,
              width: width,
              hintText: 'Jop title',
              handler: experienceHandler.jopTitle),
          TextFieldForAddScreen(
              // textEditingController: textEditingController.period,
              height: height,
              width: width,
              hintText: 'period',
              handler: experienceHandler.period),
          TextFieldForAddScreen(
              // textEditingController: textEditingController.details,
              height: height,
              width: width,
              hintText: 'Some details',
              handler: experienceHandler.details),
          const Divider()
        ],
      );
    });
  }
}

class EducationWidget extends StatelessWidget {
  Education education;

  double height;

  double width;
  UserData data;

  int index;

  int numberOfExperiences;
  EducationHandler educationHandler =
      EducationHandler(); //TODO:should be replaced with Education handler

  EducationWidget(
      {Key? key,
      required this.width,
      required this.height,
      required this.education,
      required this.data,
      required this.index,
      required this.numberOfExperiences})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserDataHandlersProvider>(builder: (_, provider, __) {
      provider.educationHandler(
          educationHandler, index, numberOfExperiences, data.degrees[index]);
      return Column(
        children: [
          Row(
            children: [
              TextFieldForAddScreen(
                // textEditingController: textEditingController.companyName,
                height: height,
                width: width,
                hintText: 'School name',
                handler: educationHandler.schoolName,
              ),
              TextFieldForAddScreen(
                  // textEditingController: textEditingController.companyLocation,
                  height: height,
                  width: width,
                  hintText: 'Major',
                  handler: educationHandler.major),
              TextFieldForAddScreen(
                  // textEditingController: textEditingController.period,
                  height: height,
                  width: width,
                  hintText: 'Degree',
                  handler: educationHandler.degree),
              TextFieldForAddScreen(
                  // textEditingController: textEditingController.period,
                  height: height,
                  width: width,
                  hintText: 'Period',
                  handler: educationHandler.period),
              TextFieldForAddScreen(
                  // textEditingController: textEditingController.period,
                  height: height,
                  width: width,
                  hintText: 'Location',
                  handler: educationHandler.location),
            ],
          ),
          TextFieldForAddScreen(
              // textEditingController: textEditingController.details,
              height: height,
              width: width * 3,
              hintText: 'Some details',
              handler: educationHandler.details),
          const Divider()
        ],
      );
    });
  }
}

class TextFieldForAddScreen extends StatelessWidget {
  // final TextEditingController textEditingController;
  final double width;
  final double height;
  final String hintText;
  final Function(String) handler;

  const TextFieldForAddScreen(
      {/*required this.textEditingController,*/
      required this.height,
      this.width = double.infinity,
      required this.hintText,
      required this.handler,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: height,
        // width: width,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(35)),
        child: SizedBox(
          width: width,
          height: height,
          child: TextField(
            // controller: textEditingController,
            onChanged: handler,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade100,
                  ),
                  borderRadius: BorderRadius.circular(35)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade100,
                  ),
                  borderRadius: BorderRadius.circular(35)),
            ),
          ),
        ),
      ),
    );
  }
}

class ImagePicker extends StatelessWidget {
  const ImagePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.grey.shade400,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
          ),
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Add image'), Icon(Icons.add_photo_alternate)],
          ),
        ),
      ),
    );
  }
}

class DataUploaderToTheDatabase extends StatelessWidget {
  const DataUploaderToTheDatabase({required this.function, Key? key})
      : super(key: key);
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.grey.shade400,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
          ),
          onPressed: () {
            function();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Add',
                style: TextStyle(fontSize: 20),
              ),
              FaIcon(
                FontAwesomeIcons.database,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
