import 'package:cv_builder/models/data_fields.dart';
import 'package:cv_builder/models/education.dart';
import 'package:cv_builder/models/experience.dart';
import 'package:cv_builder/models/skill.dart';
import 'package:cv_builder/models/user_data.dart';
import 'package:cv_builder/providers/show_hide_provider.dart';
import 'package:cv_builder/widgets/composite_show_hide_field.dart';
import 'package:cv_builder/widgets/single_value_show_hide_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowHideScreen extends StatefulWidget {
  const ShowHideScreen({Key? key}) : super(key: key);

  @override
  State<ShowHideScreen> createState() => _ShowHideScreenState();
}

class _ShowHideScreenState extends State<ShowHideScreen> {
  late UserData userData;

  @override
  Widget build(BuildContext context) {
    userData = UserData(
        name: "Abdelrhman Yaseen",
        phoneNumber: "+597501896",
        email: "abdelrhmnYaseen@gmail.com",
        experiences: [
          Experience(jobTitle: "Web developer", companyName: "Unit One"),
        ],
        skills: [
          Skill(skillName: "Flutter development", value: 0.6, size: 50),
          Skill(skillName: "Web development", value: 0.6, size: 50),
        ],
        degrees: [
         Education("Waterloo", "Canda", "Master", "Computer Science", "", "details")
        ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ShowHideProvider()),
      ],
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Check the fields you want to show on your CV,Please",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 50,
              ),
              Wrap(
                children: [
                  if (userData.name.isNotEmpty)
                    SingleValueShowHideField(
                      fieldValue: userData.name,
                      dataFields: DataFields.name,
                    ),
                  if (userData.phoneNumber.isNotEmpty)
                    SingleValueShowHideField(
                      fieldValue: userData.phoneNumber,
                      dataFields: DataFields.phoneNumber,
                    ),
                  if (userData.email.isNotEmpty)
                    SingleValueShowHideField(
                      fieldValue: userData.email,
                      dataFields: DataFields.email,
                    ),
                  if (userData.city.isNotEmpty)
                    SingleValueShowHideField(
                      fieldValue: userData.city,
                      dataFields: DataFields.city,
                    ),
                  if (userData.street.isNotEmpty)
                    SingleValueShowHideField(
                      fieldValue: userData.street,
                      dataFields: DataFields.street,
                    ),
                  if (userData.currentPosition.isNotEmpty)
                    SingleValueShowHideField(
                      fieldValue: userData.currentPosition,
                      dataFields: DataFields.currentPosition,
                    ),
                  if (userData.skills.isNotEmpty)
                    CompositeShowHideField(
                        dataFields: DataFields.skills,
                        fieldValues: userData.skills),
                  if (userData.degrees.isNotEmpty)
                    CompositeShowHideField(
                        dataFields: DataFields.degrees,
                        fieldValues: userData.degrees),
                  if (userData.skills.isNotEmpty)
                    CompositeShowHideField(
                        dataFields: DataFields.experiences,
                        fieldValues: userData.experiences),
                  Consumer<ShowHideProvider>(builder: (_, pro, __) {
                    return Column(
                      children: [
                        Text(pro.getData().name),
                      ],
                    );
                  })
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Consumer<ShowHideProvider>(builder: (_, provider, __) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () async {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Go back',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        provider.resumeGenerator();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Create CV',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                );
              })
            ],
          ),
        ),
      )),
    );
  }
}
