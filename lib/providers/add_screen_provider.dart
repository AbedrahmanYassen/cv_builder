import 'package:cv_builder/models/user_data.dart';
import 'package:flutter/material.dart';

class AddScreenProvider with ChangeNotifier {

  void removeWidget(int index, List<Widget> list){
    list.removeAt(index);
    notifyListeners();
  }
  void addWidget(Widget defaultWidget , List<Widget> list ){
    list.add(defaultWidget);
    notifyListeners();
  }
}