import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
          ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        actions: [
          IconButton(icon: const Icon(Icons.add_box), onPressed: () {}),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
            decoration: const BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF6dd5ed), // Warna bawah (Biru Muda)
              Color(0xFF2193b0), // Warna atas (Biru)
            ],
          ),
        ),
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 130),  //memberikan jarak antar widget
            Text(
              "Yogyakarta",
               style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),
            Text(
              "Today",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey
              ),
            ),

            SizedBox(height: 40),
            Text(
              "28°C",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 100,
                color: Colors.indigo
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25), // ✅ Tambahkan padding di luar Divider
              child: Divider(
                height: 15,
                thickness: 2,
                color: Colors.blueGrey,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Sunny",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black54
              ),
            ),

            SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.ac_unit, color: Colors.indigoAccent, size: 35),
              Text(
                "5 km/h",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54
                ),
              ),
              ]
            ),

            SizedBox(height: 20),

            // CARD CUACA 7 HARI
            Card(
              color: Colors.blue.shade100,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Tambahkan ini agar isi juga ikut rata kiri
                  children: [
                    // Menjadikan teks "Next 7 days" rata kiri
                    Align(
                      alignment: Alignment.centerLeft, // Posisi kiri
                      child: Text(
                        "Next 7 days",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _weatherColumn("Now", "28°C", Icons.ac_unit, "10 km/h", "0%"),
                        _weatherColumn("17:00", "28°C", Icons.ac_unit, "10 km/h", "0%"),
                        _weatherColumn("20:00", "28°C", Icons.ac_unit, "10 km/h", "0%"),
                        _weatherColumn("23:00", "28°C", Icons.ac_unit, "10 km/h", "0%"),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),
            Align(
                    alignment: Alignment.center, // Footer tetap rata tengah
                    child: Text(
                      "Developed by: iffatuzzahra.id",
                      style: TextStyle(fontSize: 14, color: Colors.blueGrey),
                    ),
                  ),
            ]
        )
    ));
  }

  Widget _weatherColumn(String time, String temp, IconData icon, String windSpeed, String humidity) {
    return Column(
      children: [
        Text(time, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Icon(icon, color: Colors.blue, size: 30),
        SizedBox(height: 5),
        Text(temp, style: TextStyle(fontSize: 16, color: Colors.black)),
        SizedBox(height: 5),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wind_power, color: Colors.red, size: 18),
            SizedBox(width: 3),
            SizedBox(height: 5),
            Text(
              windSpeed,
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
          ],
        ),
        SizedBox(height: 5),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.umbrella, color: Colors.black, size: 18),
            SizedBox(width: 3),
            SizedBox(height: 5),
            Text(
              humidity,
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            SizedBox(height: 5),
          ],
        ),
      ],
    );
  }
}


