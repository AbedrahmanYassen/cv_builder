// import 'package:ecommerce_app_training/providers/admin_related_providers/add_screen_manager.dart';
import 'package:cv_builder/models/experience.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  TextEditingController categoryController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  TextEditingController brandController = new TextEditingController();
  ExperienceEditingController experienceEditingController =
      ExperienceEditingController(
          companyName: TextEditingController(),
          jopTitle: TextEditingController(),
          period: TextEditingController(),
          details: TextEditingController(),
          companyLocation: TextEditingController());

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    priceController.dispose();
    categoryController.dispose();
    descriptionController.dispose();
    brandController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // AddScreenManager addScreenManager =
    // Provider.of<AddScreenManager>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
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
                      Container(
                        // width: 150,
                        // height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          // image: DecorationImage(
                          //   image: AssetImage('assets/images/add.jpg'),
                          // ),
                        ),
                      ),
                      TextFieldForAddScreen(
                        hintText: 'Name',
                        height: 50,
                        textEditingController: nameController,
                      ),
                      TextFieldForAddScreen(
                        hintText: 'Phone number',
                        height: 50,
                        textEditingController: priceController,
                      ),
                      TextFieldForAddScreen(
                        hintText: 'Email',
                        height: 50,
                        textEditingController: categoryController,
                      ),
                      TextFieldForAddScreen(
                        hintText: 'Country',
                        height: 50,
                        textEditingController: descriptionController,
                      ),
                      TextFieldForAddScreen(
                          textEditingController: brandController,
                          height: 50,
                          hintText: 'City'),
                      TextFieldForAddScreen(
                          textEditingController: brandController,
                          height: 50,
                          hintText: 'Current position'),
                      const SizedBox(
                        height: 20,
                      ),
                      MultiInputDataForms(
                        listOfItems: [
                          ExperienceWidget(
                            width: 0.0,
                            height: 50,
                            data: Experience(
                                companyName: '',
                                companyLocation: '',
                                jobTitle: '',
                                period: '',
                                details: ''),
                            textEditingController: ExperienceEditingController(
                                companyName: nameController,
                                jopTitle: nameController,
                                period: nameController,
                                details: nameController,
                                companyLocation: nameController),
                          ),
                          ExperienceWidget(
                            width: 0.0,
                            height: 50,
                            data: Experience(
                                companyName: '',
                                companyLocation: '',
                                jobTitle: '',
                                period: '',
                                details: ''),
                            textEditingController: experienceEditingController,
                          )
                        ],
                      ),
                      ImagePicker(),
                      DataUploaderToTheDatabase(
                        function: () {
                          // addScreenManager.addUser(
                          //     name: nameController.text,
                          //     price: priceController.text,
                          //     category: categoryController.text,
                          //     description: descriptionController.text,
                          //     brand: brandController.text,
                          //     context: context);
                          experienceEditingController.companyName.text =
                              "Hello world";
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MultiInputDataForms extends StatelessWidget {
  final List<Widget> listOfItems;

  const MultiInputDataForms({Key? key, required this.listOfItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Experience",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 400,
          child: ListView(
              children: List.generate(
                  listOfItems.length, (index) => listOfItems[index])),
        ),
      ],
    );
  }
}

class ExperienceWidget extends StatelessWidget {
  Experience data;

  double height;

  double width;
  ExperienceEditingController textEditingController;

  ExperienceWidget(
      {Key? key,
      required this.width,
      required this.height,
      required this.data,
      required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        TextFieldForAddScreen(
            textEditingController: textEditingController.companyName,
            height: 30,
            width: 200,
            hintText: 'Company name'),
        TextFieldForAddScreen(
            textEditingController: textEditingController.companyLocation,
            height: 30,
            width: 200,
            hintText: 'Jop title'),
        TextFieldForAddScreen(
            textEditingController: textEditingController.period,
            height: 30,
            width: 200,
            hintText: 'period'),
        TextFieldForAddScreen(
            textEditingController: textEditingController.details,
            height: 30,
            width: 200,
            hintText: 'Some details'),
        const Divider()
      ],
    );
  }
}

class ExperienceEditingController {
  TextEditingController companyName;

  ExperienceEditingController(
      {required this.companyName,
      required this.jopTitle,
      required this.period,
      required this.details,
      required this.companyLocation});

  TextEditingController jopTitle;

  TextEditingController period;

  TextEditingController details;

  TextEditingController companyLocation;
}

class TextFieldForAddScreen extends StatelessWidget {
  final TextEditingController textEditingController;
  final double width;
  final double height;
  final String hintText;

  const TextFieldForAddScreen(
      {required this.textEditingController,
      required this.height,
      this.width = double.infinity,
      required this.hintText,
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
            controller: textEditingController,
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
            children: [
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
