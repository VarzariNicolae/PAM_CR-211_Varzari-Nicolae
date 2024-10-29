import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../models/doctor_model.dart';
import '../models/banner_model.dart';
import '../models/category_model.dart';
import '../models/nearby_center_model.dart';

class DoctorController extends GetxController {
  var doctors = <Doctor>[].obs;
  var banners = <BannerItem>[].obs;
  var categories = <Category>[].obs;
  var nearbyCenters = <NearbyCenter>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    try {
      isLoading(true);
      final jsonString =
          await rootBundle.loadString('assets/json/doctors.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);

      // Load each data type
      final List<dynamic> bannerList = jsonData["banners"];
      banners(bannerList.map((e) => BannerItem.fromJson(e)).toList());

      final List<dynamic> categoryList = jsonData["categories"];
      categories(categoryList.map((e) => Category.fromJson(e)).toList());

      final List<dynamic> nearbyCenterList = jsonData["nearby_centers"];
      nearbyCenters(
          nearbyCenterList.map((e) => NearbyCenter.fromJson(e)).toList());

      final List<dynamic> doctorList = jsonData["doctors"];
      doctors(doctorList.map((e) => Doctor.fromJson(e)).toList());
    } catch (e) {
      print("Error loading JSON: $e");
    } finally {
      isLoading(false);
    }
  }
}
