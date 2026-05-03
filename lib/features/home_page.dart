import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'favorites_controller.dart';
import 'property_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedIndex = 0;

  final List<String> locations = [
    "All",
    "New York",
    "Dubai",
    "Paris",
    "London",
    "Switzerland",
    "Istanbul",
    "Tokyo",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      

      // ✅ زر المراسلة تحت الشمال
      floatingActionButton: Padding(
        
        padding: const EdgeInsets.only(right: 10),
        child: FloatingActionButton(
          
          backgroundColor: Colors.green,
          onPressed: () async {
            final url = Uri.parse("https://wa.me/201278900199");
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            }
          },
          child: const Icon(Icons.message, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildCategories(),
              const SizedBox(height: 20),
              _buildFeatured(),
            ],
          ),
        ),
      ),
    );
  }

  // 🔥 HEADER
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff7B2FF7), Color(0xff9A2FF7)],
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome to",
                      style: TextStyle(color: Colors.white70)),
                  SizedBox(height: 5),
                  Text("EliteHomes",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                ],
              ),

              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none,
                    color: Colors.white, size: 30),
              )
            ],
          ),

          const SizedBox(height: 20),

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
                      hintText: "Search location",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // 🔥 LOCATIONS
  Widget _buildCategories() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemCount: locations.length,
        itemBuilder: (context, index) {

          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xff7B2FF7)
                    : Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  locations[index],
                  style: TextStyle(
                    color: isSelected
                        ? Colors.white
                        : Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // 🏡 Featured
  Widget _buildFeatured() {
    final properties = [
      PropertyModel(
        id: "1",
        title: "Modern Villa",
        image:
            "https://images.unsplash.com/photo-1600585154340-be6161a56a0c",
        price: "\$2,850,000",
        location: "New York",
      ),
      PropertyModel(
        id: "2",
        title: "Luxury House",
        image:
            "https://images.unsplash.com/photo-1600585154340-be6161a56a0c",
        price: "\$1,950,000",
        location: "Dubai",
      ),
      PropertyModel(
        id: "3",
        title: "Beach Villa",
        image:
            "https://images.unsplash.com/photo-1600585154340-be6161a56a0c",
        price: "\$3,200,000",
        location: "Paris",
      ),
    ];

    final filtered = selectedIndex == 0
        ? properties
        : properties.where((p) =>
            p.location == locations[selectedIndex]).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Featured Properties",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),

          Column(
            children: filtered
                .map((p) => propertyCard(p))
                .toList(),
          )
        ],
      ),
    );
  }

  // ❤️ Card
  Widget propertyCard(PropertyModel property) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              property.image,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            bottom: 10,
            left: 10,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xff7B2FF7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                property.price,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),

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
        ],
      ),
    );
  }
}