import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text(
          "Water Drone Patrol Controller",
          style: GoogleFonts.firaSans(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(93, 174, 255, 1.0),
      shadowColor: Colors.black54,
      elevation: 20,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
