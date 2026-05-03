import 'package:flutter/material.dart';
import 'ServiceItem.dart';
import 'ServiceSection.dart';
class ServicesScreen extends StatelessWidget {
  final List<String> tabs = [
    "Buying",
    "Selling",
    "Renting",
    "Investing",
    "Commercial"
  ];

  ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Services",style: TextStyle(color: Colors.white),),
          
          centerTitle: true,
          backgroundColor: const Color(0xff7B2FF7),
          
          bottom: TabBar(
            isScrollable: true,
            labelColor: const Color.fromARGB(255, 255, 255, 255),
            unselectedLabelColor: Colors.white,
            indicatorColor: const Color.fromARGB(255, 255, 255, 255),
            tabs: const [
              Tab(text: "Buying"),
              Tab(text: "Selling"),
              Tab(text: "Renting"),
              Tab(text: "Investing"),
              Tab(text: "Commercial"),
            ],
          ),
        ),

        /// 👇 BODY
        body: TabBarView(
          children: [
            /// 🟣 BUYING
            ServiceSection(
              title: "Home Buying Made Simple",
              description:
                  "Our expert team guides you through every step of the home buying process.",
              image:
                  "https://ahmedzas434-sys.github.io/EliteHomes---Your-Dream-Home-Awaits/images/image13.png",
              stat: "98%",
              statLabel: "Success Rate",
              colors: const [Color(0xff7B2FF7), Color(0xff9A2FF7)],
              items: const [
                {
                  "icon": Icons.search,
                  "title": "Property Search",
                  "subtitle": "Find best listings"
                },
                {
                  "icon": Icons.account_balance,
                  "title": "Financial Planning",
                  "subtitle": "Plan your budget"
                },
                {
                  "icon": Icons.handshake,
                  "title": "Negotiation",
                  "subtitle": "Best deals"
                },
              ],
            ),

            /// 🟢 SELLING
            ServiceSection(
              title: "Maximize Your Home's Value",
              
              description: "Sell your property quickly and easily.",
              
              image:
                  "https://ahmedzas434-sys.github.io/EliteHomes---Your-Dream-Home-Awaits/images/image14.png",

                  

              stat: "21 days",
              statLabel: "Avg. Time to Sell",
              colors: const [Colors.green, Colors.greenAccent],
              items: const [
                {
                  "icon": Icons.show_chart,
                  "title": "Market Analysis",
                  "subtitle": "Best pricing"
                },
                {
                  "icon": Icons.camera_alt,
                  "title": "Marketing",
                  "subtitle": "High quality ads"
                },
                {
                  "icon": Icons.people,
                  "title": "Buyer Screening",
                  "subtitle": "Serious buyers"
                },
              ],
            ),

            /// 🔵 RENTING
            ServiceSection(
              title: "Premium Rental Properties",
              description: "Find your perfect rental home.",
              image:
                  "https://ahmedzas434-sys.github.io/EliteHomes---Your-Dream-Home-Awaits/images/image15.png",
              stat: "5,000+",
              statLabel: "Rentals",
              colors: const [Color(0xff7B2FF7), Color(0xff9A2FF7)],
              items: const [
                {
                  "icon": Icons.location_on,
                  "title": "Prime Locations",
                  "subtitle": "Best areas"
                },
                {
                  "icon": Icons.verified,
                  "title": "Verified",
                  "subtitle": "Trusted listings"
                },
                {
                  "icon": Icons.support,
                  "title": "Support",
                  "subtitle": "24/7 help"
                },
              ],
            ),

            /// 🟠 INVESTING
            ServiceSection(
              title: "Real Estate Investment",
              description: "Grow your wealth smartly.",
              image:
                  "https://ahmedzas434-sys.github.io/EliteHomes---Your-Dream-Home-Awaits/images/image16.png",
              stat: "15%",
              statLabel: "ROI",
              colors: const [Colors.orange, Colors.deepOrange],
              items: const [
                {
                  "icon": Icons.pie_chart,
                  "title": "Portfolio",
                  "subtitle": "Smart analysis"
                },
                {
                  "icon": Icons.trending_up,
                  "title": "ROI",
                  "subtitle": "High returns"
                },
                {
                  "icon": Icons.settings,
                  "title": "Management",
                  "subtitle": "Full control"
                },
              ],
            ),

            /// 🔷 COMMERCIAL
            ServiceSection(
              title: "Commercial Real Estate",
              description: "Best business locations.",
              image:
                  "https://ahmedzas434-sys.github.io/EliteHomes---Your-Dream-Home-Awaits/images/image17.png",
              stat: "\$2.5B",
              statLabel: "Volume",
              colors: const [Colors.blue, Colors.indigo],
              items: const [
                {
                  "icon": Icons.business,
                  "title": "Offices",
                  "subtitle": "Work spaces"
                },
                {
                  "icon": Icons.factory,
                  "title": "Industrial",
                  "subtitle": "Warehouses"
                },
                {
                  "icon": Icons.store,
                  "title": "Retail",
                  "subtitle": "Shops"
                },
              ],
            ),
          ],
        ),
      ),
    );
  }
}