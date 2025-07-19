import 'package:flutter/material.dart';

class TipRequestScreen extends StatefulWidget {
  const TipRequestScreen({
    super.key,
    required String title,
    required Null Function() onPressed,
  });

  @override
  State<TipRequestScreen> createState() => _TipRequestScreenState();
}

class _TipRequestScreenState extends State<TipRequestScreen> {
  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Trip Request"), centerTitle: true),
      body: isAccepted ? buildArrivedUI() : buildArrivedUI(),
    );
  }

  // Initial TAP TO ACCEPT UI
  Widget buildAcceptUI() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              isAccepted = true;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            minimumSize: const Size.fromHeight(50),
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
    );
  }

  // After Accept: ARRIVED UI
  Widget buildArrivedUI() {
    return Column(
      children: [
        const SizedBox(height: 16),

        // ETA, Distance, and Avatar
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "2 min",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage(
                'assets/img/user.jpg',
              ), // Replace this
            ),
            const Text(
              "0.5 mi",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const Icon(Icons.phone),
          ],
        ),

        const SizedBox(height: 8),
        const Text(
          "Picking up James Smith",
          style: TextStyle(color: Colors.grey),
        ),
        const Divider(height: 30, thickness: 1),

        // Action Buttons
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              ActionItem(icon: Icons.chat_bubble_outline, label: "Chat"),
              ActionItem(icon: Icons.message_outlined, label: "Message"),
              ActionItem(icon: Icons.cancel_outlined, label: "Cancel Trip"),
            ],
          ),
        ),

        const Spacer(),

        // ARRIVED Button
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: () {
                // Handle "Arrived" tap
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "ARRIVED",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ActionItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const ActionItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.grey.shade200,
          child: Icon(icon, color: Colors.black),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 13)),
      ],
    );
  }
}
