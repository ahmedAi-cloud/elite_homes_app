import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'property_details_screen.dart';
import 'favorites_controller.dart';
import 'property_model.dart';

class PropertiesScreen extends StatelessWidget {
  const PropertiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      body: SafeArea(
        child: Column(
          children: [
            _header(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(15),
                children: [
                  const Text("6 properties available",
                      style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 15),

                  _propertyCard(context),
                  const SizedBox(height: 20),
                  _propertyCard(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔥 Header
  Widget _header() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff7B2FF7), Color(0xff9A2FF7)],
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("All Properties",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),

          const SizedBox(height: 15),

          // 🔍 Search
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                Icon(Icons.search, color: Colors.grey),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search properties...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Icon(Icons.tune, color: Color(0xff7B2FF7)),
              ],
            ),
          )
        ],
      ),
    );
  }

  // 🏡 Card
  Widget _propertyCard(BuildContext context) {

    final property = PropertyModel(
      id: DateTime.now().toString(), // unique id
      title: "Modern Villa with Pool",
      image:
          "https://images.unsplash.com/photo-1600585154340-be6161a56a0c",
      price: "\$2,850,000",
      location: "Beverly Hills, CA",
    );

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => const PropertyDetailsScreen()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Stack(
              children: [

                /// 🖼️ الصورة
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.network(
                    property.image,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                /// نوع العقار
                Positioned(
                  left: 10,
                  top: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text("Villa"),
                  ),
                ),

                /// ❤️ زر المفضلة
                Positioned(
                  right: 10,
                  top: 10,
                  child: Consumer<FavoritesController>(
                    builder: (context, favController, child) {

                      final isFav = favController.isFavorite(property);

                      return GestureDetector(
                        onTap: () {
                          favController.toggleFavorite(property);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            isFav
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                /// 💰 السعر
                Positioned(
                  left: 10,
                  bottom: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xff7B2FF7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      property.price,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),

            /// 📄 التفاصيل
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(property.title,
                      style:
                          const TextStyle(fontWeight: FontWeight.bold)),

                  const SizedBox(height: 5),

                  Text(property.location,
                      style: const TextStyle(color: Colors.grey)),

                  const SizedBox(height: 10),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("5 Beds"),
                      Text("4 Baths"),
                      Text("4,200 sqft"),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}