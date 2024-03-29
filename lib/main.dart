import 'package:cv_builder/helpers/route_helper.dart';
import 'package:cv_builder/routes/add_info.dart';
import 'package:cv_builder/routes/home.dart';
import 'package:cv_builder/routes/on_boarding.dart';
import 'package:cv_builder/routes/show_hide_screen.dart';
import 'package:cv_builder/routes/sign_up.dart';
import 'package:docx_template/docx_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:universal_io/io.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      onGenerateRoute: RouteHelper.manageRoute,
    );
  }
}
