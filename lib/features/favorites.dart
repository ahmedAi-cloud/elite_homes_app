import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorites_controller.dart';
import 'property_model.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favController = context.watch<FavoritesController>();
    final favorites = favController.favorites;

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      body: Column(
        children: [

          // 🔥 Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff7B2FF7), Color(0xff9A2FF7)],
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Text(
                  "Favorites",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  "Your saved properties",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          // 📦 Content
          Expanded(
            child: favorites.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite_border,
                            size: 80, color: Colors.grey),
                        SizedBox(height: 10),
                        Text("No favorites yet"),
                        Text("Start adding properties ❤️"),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: favorites.length,
                    itemBuilder: (context, index) {
                      final item = favorites[index];

                      return Card(
                        elevation: 3,
                        margin: const EdgeInsets.only(bottom: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            // 🖼️ صورة + زر إزالة
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      const BorderRadius.vertical(
                                          top: Radius.circular(15)),
                                  child: Image.network(
                                    item.image,
                                    height: 180,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                // ❤️ زر إزالة من المفضلة
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: GestureDetector(
                                    onTap: () {
                                      favController.toggleFavorite(item);
                                    },
                                    child: const CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // 📄 التفاصيل
                            ListTile(
                              title: Text(
                                item.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(item.location),
                              trailing: Text(
                                item.price,
                                style: const TextStyle(
                                    color: Color(0xff7B2FF7),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}