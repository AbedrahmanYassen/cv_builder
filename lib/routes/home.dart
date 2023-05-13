import 'package:cv_builder/routes/add_info.dart';
import 'package:cv_builder/routes/show_hide_screen.dart';
import 'package:cv_builder/routes/sign_in.dart';
import 'package:cv_builder/routes/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/img.png"),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Positioned(
          bottom: 360,
          left: 100,
          child: Container(
            alignment:
                Alignment.lerp(Alignment.topCenter, Alignment.center, .9),
            width: 163.64,
            height: 119.17,
            decoration: const BoxDecoration(
                // image: DecorationImage(
                //   image: AssetImage("assets/images/profile.jpg"),
                //   fit: BoxFit.cover,
                // ),
                ),
          ),
        ),
        Positioned(
          bottom: 110,
          left: 65,
          child: Container(
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => AddScreen()));
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xffEC6454),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                width: 275,
                height: 48,
                child: const Center(
                  child: Text(
                    'Edit your Information',
                    textScaleFactor: 1,
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          left: 65,
          child: Container(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ShowHideScreen()));
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xff2E3046),
                  boxShadow: [
                    BoxShadow(color: Color(0xffFEFEFE), spreadRadius: 1),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                width: 275,
                height: 48,
                child: const Center(
                  child: Text(
                    'Create CV',
                    textScaleFactor: 1,
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
