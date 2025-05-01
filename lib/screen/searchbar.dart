import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  TextEditingController searchController = TextEditingController();
  List<String> items = ["Ice Americano", "Espresso", "Latte", "Tea", "Snack"];
  List<String> searchResults = [];

  @override
  void initState() {
    super.initState();
    searchResults = items;
  }

  void search(String query) {
    final suggestions = items.where((item) {
      return item.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      searchResults = suggestions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppPallete.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            // Search Icon
            Icon(Icons.search, color: AppPallete.main),

            Gap(10),

            // Text Field
            Expanded(
              child: TextField(
                controller: searchController,
                onChanged: search,
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: AppPallete.grey),
                  border: InputBorder.none,
                ),
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppPallete.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
