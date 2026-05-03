import 'package:flutter/material.dart';
import 'ServiceItem.dart';

class ServiceSection extends StatelessWidget {
  final String title;
  final String description;
  final List<Map<String, dynamic>> items;
  final String image;
  final String stat;
  final String statLabel;
  final List<Color> colors;

  const ServiceSection({
    super.key,
    required this.title,
    required this.description,
    required this.items,
    required this.image,
    required this.stat,
    required this.statLabel,
    required this.colors,
  });

 @override
Widget build(BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const SizedBox(height: 20),

        /// 🔥 ROW
      Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

    /// 🖼️ IMAGE + CARD
    Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
  image,
  height: 200,
  width: double.infinity,
  fit: BoxFit.cover,
  errorBuilder: (context, error, stackTrace) {
    return Container(
      height: 200,
      color: Colors.grey[300],
      child: const Center(
        child: Icon(Icons.image_not_supported),
      ),
    );
  },
),
        ),

        Positioned(
          bottom: 10,
          left: 10,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                )
              ],
            ),
            child: Column(
              children: [
                Text(
                  stat,
                  style: TextStyle(
                    color: colors[0],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(statLabel),
              ],
            ),
          ),
        ),
      ],
    ),

    const SizedBox(height: 20),

    /// 📋 SERVICES LIST
    Column(
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: ServiceItem(
            icon: item["icon"],
            title: item["title"],
            subtitle: item["subtitle"],
            color: colors[0],
          ),
        );
      }).toList(),
    ),
  ],
)
      ],
    ),
  );
}
}