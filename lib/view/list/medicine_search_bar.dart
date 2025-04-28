import 'package:flutter/material.dart';

class MedicineSearchBar extends StatelessWidget implements PreferredSizeWidget {
  const MedicineSearchBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            // filled: true,
            // fillColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
