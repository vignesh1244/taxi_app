import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

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
          // Positioned(
          //   top: 50,
          //   left:
          //       MediaQuery.of(context).size.width / 2 -
          //       60, // Center horizontally
          //   child: CircleAvatar(
          //     radius: 60,
          //     backgroundImage: AssetImage('assets/img/sm_profile.png'),
          //     backgroundColor: Colors.grey[200], // fallback background
          //   ),
          // ),
          OSMFlutter(
            controller: MapController(
              initPosition: GeoPoint(
                latitude: 47.4358055,
                longitude: 8.4737324,
              ),
              areaLimit: const BoundingBox(
                east: 10.4922941,
                north: 47.8084648,
                south: 45.817995,
                west: 5.9559113,
              ),
            ),
            osmOption: OSMOption(
              userTrackingOption: const UserTrackingOption(
                enableTracking: true,
                unFollowUser: false,
              ),
              zoomOption: const ZoomOption(
                initZoom: 8,
                minZoomLevel: 3,
                maxZoomLevel: 19,
                stepZoom: 1.0,
              ),
              userLocationMarker: UserLocationMaker(
                personMarker: const MarkerIcon(
                  icon: Icon(
                    Icons.location_history_rounded,
                    color: Colors.red,
                    size: 48,
                  ),
                ),
                directionArrowMarker: const MarkerIcon(
                  icon: Icon(Icons.double_arrow, size: 48),
                ),
              ),
              roadConfiguration: const RoadOption(
                roadColor: Colors.yellowAccent,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
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
                    child: Column(
                      children: [
                        Divider(),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                isOnline ? "Online" : "Offline",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: isOnline ? Colors.green : Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: toggleStatus,
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: isOnline ? Colors.red : Colors.green,
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
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _infoCard(
                                "95.0%",
                                "Acceptance",
                                Icons.check_circle,
                              ),
                              _infoCard("4.75", "Rating", Icons.star),
                              _infoCard("2.0%", "Cancellation", Icons.cancel),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
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
