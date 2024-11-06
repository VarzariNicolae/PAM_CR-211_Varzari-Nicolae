import 'package:flutter/material.dart';

void main() {
  runApp(DoctorAppointmentApp());
}

class DoctorAppointmentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DoctorAppointmentScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DoctorAppointmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(Icons.location_on, color: Colors.black),
        title: Text("Seattle, USA", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search doctor...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://via.placeholder.com/150'),
                      radius: 30,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Looking for Specialist Doctors?",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("Schedule an appointment with our top doctors."),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text("Categories",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildCategoryCard("Dentistry", Colors.pink[100]!),
                  _buildCategoryCard("Cardiology", Colors.orange[100]!),
                  _buildCategoryCard("Pulmonology", Colors.green[100]!),
                  _buildCategoryCard("General", Colors.purple[100]!),
                  _buildCategoryCard("Neurology", Colors.teal[100]!),
                  _buildCategoryCard("Gastroenterology", Colors.blue[100]!),
                  _buildCategoryCard("Laboratory", Colors.pink[200]!),
                  _buildCategoryCard("Vaccination", Colors.orange[200]!),
                ],
              ),
              SizedBox(height: 20),
              _buildSectionHeader("Nearby Medical Centers"),
              SizedBox(height: 10),
              _buildClinicCard(
                  "Sunrise Health Clinic", "123 Oak Street, CA", 5.0, 68, 2.5),
              _buildClinicCard(
                  "Golden Cardiology", "555 Bridge Street, NY", 4.9, 50, 2.7),
              SizedBox(height: 20),
              _buildSectionHeader("532 found"),
              SizedBox(height: 10),
              _buildDoctorCard("Dr. David Patel", "Cardiologist",
                  "Cardiology Center, NY", 4.5, 1872),
              _buildDoctorCard("Dr. Jessica Turner", "Gynecologist",
                  "Women’s Clinic, Seattle", 4.7, 1429),
              _buildDoctorCard("Dr. Michael Johnson", "Orthopedic Surgery",
                  "Maple Associates, NY", 4.2, 2105),
              _buildDoctorCard("Dr. Emily Walker", "Pediatrics",
                  "Serenity Pediatrics Clinic", 4.8, 405),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClinicCard(String name, String address, double rating,
      int reviews, double distance) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          radius: 30,
        ),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(address),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                SizedBox(width: 4),
                Text("$rating (${reviews.toString()} Reviews)"),
                SizedBox(width: 10),
                Expanded(
                  child: Text("• $distance km away",
                      overflow:
                          TextOverflow.ellipsis), // Ajustare pentru overflow
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDoctorCard(String name, String specialty, String location,
      double rating, int reviews) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          radius: 30,
        ),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(specialty),
            Text(location),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                SizedBox(width: 4),
                Text("$rating (${reviews.toString()} Reviews)"),
              ],
            ),
          ],
        ),
        trailing: Icon(Icons.favorite_border),
      ),
    );
  }
}
