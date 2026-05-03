import 'package:flutter/material.dart';

class PropertyDetailsScreen extends StatelessWidget {
  const PropertyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          // 🖼️ Image
          Stack(
            children: [
              Image.network(
                "https://images.unsplash.com/photo-1600585154340-be6161a56a0c",
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              Positioned(
                top: 40,
                left: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),

              const Positioned(
                top: 40,
                right: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.favorite_border),
                ),
              ),
            ],
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("\$2,850,000",
                      style: TextStyle(
                          color: Color(0xff7B2FF7),
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),

                  const SizedBox(height: 5),

                  const Text("Modern Villa with Pool",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

                  const SizedBox(height: 5),

                  const Text("Beverly Hills, CA 90210",
                      style: TextStyle(color: Colors.grey)),

                  const SizedBox(height: 20),

                  // 🔢 Info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      _InfoBox("5", "Bedrooms"),
                      _InfoBox("4", "Bathrooms"),
                      _InfoBox("4,200", "sqft"),
                    ],
                  ),

                  const SizedBox(height: 20),

                  const Text("Description",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

                  const SizedBox(height: 10),

                  const Text(
                      "Stunning modern villa featuring contemporary architecture, open floor plan, high ceilings, and large windows..."),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// 🔥 Info Box
class _InfoBox extends StatelessWidget {
  final String value;
  final String label;

  const _InfoBox(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xffF0E9FF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(value,
              style: const TextStyle(
                  color: Color(0xff7B2FF7),
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}