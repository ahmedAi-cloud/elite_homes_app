import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildActivity(),
              const SizedBox(height: 20),
              _buildOptions(),
            ],
          ),
        ),
      ),
    );
  }

  // 🔥 HEADER
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff7B2FF7), Color(0xff9A2FF7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius:
            BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Profile",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),

          const SizedBox(height: 20),

          // 👤 User Card
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                // Avatar
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xff7B2FF7), Color(0xff9A2FF7)],
                    ),
                  ),
                  child: const Center(
                    child: Text("A",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                  ),
                ),

                const SizedBox(width: 15),

                // Info
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(" Ahmed",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    SizedBox(height: 5),
                    Text("Ahmed@gmail.com",
                        style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 5),
                    Text("Premium Member",
                        style: TextStyle(
                            color: Color(0xff7B2FF7))),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // 📊 Activity
  Widget _buildActivity() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your Activity",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _ActivityItem("12", "Saved"),
                _ActivityItem("5", "Tours"),
                _ActivityItem("8", "Viewed"),
              ],
            )
          ],
        ),
      ),
    );
  }

  // ⚙️ Options
  Widget _buildOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: const [
          _OptionTile(
            icon: Icons.language,
            title: "Language",
            isLanguage: true,
          ),
          SizedBox(height: 15),
          _OptionTile(
            icon: Icons.person,
            title: "Edit Profile",
          ),
          SizedBox(height: 15),
          _OptionTile(
            icon: Icons.settings,
            title: "Settings",
          ),
        ],
      ),
    );
  }
}

// 🔥 Activity Item
class _ActivityItem extends StatelessWidget {
  final String value;
  final String label;

  const _ActivityItem(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                color: Color(0xff7B2FF7),
                fontWeight: FontWeight.bold,
                fontSize: 18)),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

// 🔥 Option Tile
class _OptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isLanguage;

  const _OptionTile({
    required this.icon,
    required this.title,
    this.isLanguage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // Icon
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xff7B2FF7).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xff7B2FF7)),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Text(title,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w500)),
          ),

          // 🌍 Language Toggle
          if (isLanguage)
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: const [
                  // EN active
                  _LangButton(text: "EN", active: true),
                  SizedBox(width: 5),
                  _LangButton(text: "AR", active: false),
                ],
              ),
            )
          else
            const Icon(Icons.arrow_forward_ios, size: 16)
        ],
      ),
    );
  }
}

// 🔥 Language Button
class _LangButton extends StatelessWidget {
  final String text;
  final bool active;

  const _LangButton({required this.text, required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: active ? const Color(0xff7B2FF7) : Colors.transparent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: active ? Colors.white : Colors.black54,
        ),
      ),
    );
  }
}