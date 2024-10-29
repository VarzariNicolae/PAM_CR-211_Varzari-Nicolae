// home_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/doctor_controller.dart';
import 'doctor_card.dart';

class HomePage extends StatelessWidget {
  final DoctorController controller = Get.put(DoctorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find Doctors'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.doctors.isEmpty) {
          return Center(child: Text('No doctors found'));
        } else {
          return ListView.builder(
            itemCount: controller.doctors.length,
            itemBuilder: (context, index) {
              return DoctorCard(doctor: controller.doctors[index]);
            },
          );
        }
      }),
    );
  }
}
