import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:taxi_app/common_widget/icon_title_subtilte.dart';
import 'package:intl/intl.dart';
import 'package:taxi_app/view/home/map.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  MapController controller = MapController(
    initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
  );

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  bool isOnline = false;

  void toggleStatus() {
    setState(() {
      isOnline = !isOnline;
    });
  }

  bool _showStats = true;

  String formatIndianCurrency(double amount) {
    final format = NumberFormat.currency(locale: 'en_IN', symbol: '₹');
    return format.format(amount);
  }

  //   Future<void> _goToLiveLocation() async {
  //   // Request location permission
  //   var status = await Permission.location.request();
  //   if (status.isGranted) {
  //     // Get current position
  //     Position position = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.high);

  //     print("Live Location: ${position.latitude}, ${position.longitude}");

  //     // Use the location to update your map
  //     controller.changeLocation(
  //       GeoPoint(latitude: position.latitude, longitude: position.longitude),
  //     );
  //   } else {
  //     // Show message if permission denied
  //     print("Location permission denied.");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomOSMMap(),
          //////////////////////////////////////
          Padding(
            padding: const EdgeInsets.all(23.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Positioned(
                  top: 50,
                  left:
                      MediaQuery.of(context).size.width / 5 -
                      0.5, // Center horizontally
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/img/sm_profile.png'),
                    backgroundColor: Colors.grey[200], // fallback background
                  ),
                ),
                Spacer(),
                Positioned(
                  top: 50,
                  right: 20,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      formatIndianCurrency(1299.50), // Example price
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Positioned(
                  top: 50,
                  left:
                      MediaQuery.of(context).size.width / 5 -
                      0.5, // Center horizontally
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/img/u1.png'),
                    backgroundColor: Colors.grey[200], // fallback background
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Expanded(
                    // Take full width
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Divider(),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _showStats = !_showStats;
                                    });
                                  },
                                  icon: Image.asset(
                                    _showStats
                                        ? "assets/img/open_btn.png"
                                        : "assets/img/close_btn.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                GestureDetector(
                                  onTap: toggleStatus,
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: isOnline
                                          ? Colors.red
                                          : Colors.green,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "GO",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  isOnline ? "Online" : "Offline",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: isOnline ? Colors.green : Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          AnimatedCrossFade(
                            firstChild: SizedBox(
                              height: 130,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: IconTitleSubtile(
                                      title: "100%",
                                      subtitle: "accepte",
                                      imagePath: "assets/img/acceptance.png",
                                      onPressed: () {},
                                    ),
                                  ),
                                  Divider(),
                                  Expanded(
                                    child: IconTitleSubtile(
                                      title: "95.0%",
                                      subtitle: "Rating",
                                      imagePath: "assets/img/rate.png",
                                      onPressed: () {},
                                    ),
                                  ),
                                  Divider(),
                                  Expanded(
                                    child: IconTitleSubtile(
                                      title: "2.0%",
                                      subtitle: "Cancellation",
                                      imagePath: "assets/img/cancelleation.png",
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            secondChild: SizedBox.shrink(), // empty when hidden
                            crossFadeState: _showStats
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                            duration: Duration(milliseconds: 300),
                          ),

                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 8),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //     children: [
                          //       _infoCard(
                          //         "95.0%",
                          //         "Acceptance",
                          //         Icons.check_circle,
                          //       ),
                          //       _infoCard("4.75", "Rating", Icons.star),
                          //       _infoCard("2.0%", "Cancellation", Icons.cancel),
                          //     ],
                          //   ),
                          // ),

                          // Your existing button
                          // Padding(
                          //   padding: const EdgeInsets.all(16.0),
                          //   child: ElevatedButton(
                          //     onPressed: () {
                          //       // Your function here
                          //     },
                          //     child: const Text("Set Position"),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _infoCard(String value, String label, IconData icon) {
  return Column(
    children: [
      Icon(icon, color: Colors.green),
      const SizedBox(height: 4),
      Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
    ],
  );
}
