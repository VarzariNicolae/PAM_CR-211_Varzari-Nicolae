import 'package:flutter/material.dart';
import '../models/doctor_model.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorCard({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(doctor.image), // Display doctor's image
          backgroundColor: Colors.blueAccent,
        ),
        title: Text(doctor.fullName),
        subtitle: Text('${doctor.typeOfDoctor} • ${doctor.locationOfCenter}'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, color: Color(0xff9c8e14), size: 16),
                SizedBox(width: 4),
                Text(
                  '${doctor.reviewRate}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              '${doctor.reviewsCount} Reviews',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
