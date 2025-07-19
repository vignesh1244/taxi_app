import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:taxi_app/view/home/run_ride_view.dart' show TipRequestScreen;
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TipRequest extends StatelessWidget {
  const TipRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          // Map + Route Simulation
          Expanded(
            flex: 3,
            child: Stack(
              children: [
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
                // Container(
                //   color: Colors.white,
                //   width: double.infinity,
                //   child: Image.asset(
                //     'assets/img/welcome_bg.png', // Add your custom map screenshot or mock here
                //     fit: BoxFit.cover,
                //   ),
                // ),
                // Passenger icon
                Positioned(
                  top: 80,
                  left: 50,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 18,
                    child: Icon(
                      Icons.person_pin_circle,
                      color: Colors.blue,
                      size: 28,
                    ),
                  ),
                ),
                // Taxi icon
                Positioned(
                  top: 40,
                  right: 60,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 18,
                    child: Icon(
                      Icons.local_taxi,
                      color: Colors.green,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Details
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    '25 min',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text("\$12.50", style: TextStyle(fontSize: 16)),
                    Text("4.5 km", style: TextStyle(fontSize: 16)),
                    Row(
                      children: [
                        Icon(Icons.star, size: 16, color: Colors.amber),
                        SizedBox(width: 4),
                        Text("3.5", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: const [
                    Icon(Icons.circle, size: 12, color: Colors.blue),
                    SizedBox(width: 8),
                    Expanded(child: Text("1 Ash Park, Pembroke Dock, SA72")),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: const [
                    Icon(Icons.circle, size: 12, color: Colors.green),
                    SizedBox(width: 8),
                    Expanded(child: Text("54 Hollybank Rd, Southampton")),
                  ],
                ),
                const SizedBox(height: 8),
                // const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Accept trip logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigate to the next screen (replace TipRequestScreen with your actual screen)
                            // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => TipRequestScreen()));
                            // If you don't have another screen, remove this line or implement the desired logic.
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TipRequestScreen(
                                  title: 'Tip Request',
                                  onPressed: () {},
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            minimumSize: const Size.fromHeight(
                              50,
                            ), // Make it full-width if inside a Column
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'TAP TO ACCEPT',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 12),
                              CircleAvatar(
                                radius: 14,
                                backgroundColor: Colors.white,
                                child: Text(
                                  '15',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
