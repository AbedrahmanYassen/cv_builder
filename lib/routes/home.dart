import 'dart:io';
import 'dart:typed_data';

import 'package:cv_builder/models/education.dart';
import 'package:cv_builder/models/experience.dart';
import 'package:cv_builder/models/user_data.dart';
import 'package:cv_builder/services/cv_generator.dart';
import 'package:flutter/material.dart';




class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CV Builder'),
        actions: [
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to CV Builder!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                CVGenerator cvgenerator = CVGenerator(
                  UserData(
                    name: "Abdelrhman",
                    phoneNumber: "0597501896",
                    email: "abdrhman9@gmail.com",
                    experiences: [
                      Experience(
                        jobTitle: "Flutter developer",
                        details:
                            "I worked at X company on an application called Y, and I helped building the user interfaces of the application",
                      ),
                      Experience(
                        jobTitle: "Web developer",
                        details:
                        "I worked at Z company on building APIs for their product, and many back-end related tasks",
                      ),
                    ],
                    skills: ["Flutter", "machine learning" , "English language"],
                    degrees: [
                      Education(
                          "Islamic university",
                          "location",
                          "",
                          "Computer Engineering",
                          "",
                          "At 2024 I finished my degree with X GPA"),
                      Education(
                          "Waterloo",
                          "location",
                          "",
                          "Master in Computer Science",
                          "",
                          "At 2024 I finished my degree with X GPA")
                    ],
                  ),
                );
                Uint8List result =
                    await cvgenerator.generateResume(cvgenerator.data);
                File file = File("example.pdf");
                file.writeAsBytes(result);
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Create a New CV',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: const Text(
                'View My CVs',
                style: TextStyle(
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
