import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/doctor_controller.dart';
import 'views/doctor_list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Laboratorul 3 Varzari Nicolae',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DoctorListView(),
    );
  }
}
