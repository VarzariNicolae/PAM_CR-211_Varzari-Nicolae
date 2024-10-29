import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../controllers/doctor_controller.dart';
import 'doctor_card.dart';

class DoctorListView extends StatelessWidget {
  final DoctorController doctorController = Get.put(DoctorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find Doctors'),
      ),
      body: Obx(() {
        if (doctorController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Slider for banners
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CarouselSlider.builder(
                    itemCount: doctorController.banners.length,
                    options: CarouselOptions(
                      height: 180,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                    ),
                    itemBuilder: (context, index, realIndex) {
                      final banner = doctorController.banners[index];
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12)),
                              child: FadeInImage.assetNetwork(
                                placeholder:
                                    'assets/images/placeholder.png', // Asigură-te că ai o imagine placeholder în folderul corespunzător
                                image: banner.image,
                                width: double.infinity,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    banner.title,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 4),
                                  Text(banner.description),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // Categories section with Slider
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Categories",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                CarouselSlider.builder(
                  itemCount: doctorController.categories.length,
                  options: CarouselOptions(
                    height: 100,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                  ),
                  itemBuilder: (context, index, realIndex) {
                    final category = doctorController.categories[index];
                    return Container(
                      width: 80,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(category.icon),
                            radius: 30,
                          ),
                          SizedBox(height: 6),
                          Text(category.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    );
                  },
                ),

                // Nearby centers section
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Nearby Centers",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: doctorController.nearbyCenters.length,
                  itemBuilder: (context, index) {
                    final center = doctorController.nearbyCenters[index];
                    return ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/placeholder.png',
                          image: center.image,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(center.title,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(
                          "${center.locationName} • ${center.distanceKm} km, ${center.distanceMinutes} min"),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 20),
                          Text("${center.reviewRate} (${center.countReviews})"),
                        ],
                      ),
                    );
                  },
                ),

                // Doctors section
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Doctors",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: doctorController.doctors.length,
                  itemBuilder: (context, index) {
                    final doctor = doctorController.doctors[index];
                    return DoctorCard(doctor: doctor);
                  },
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
