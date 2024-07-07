import 'package:boat_controller/ui/pages/connection_progres_page.dart';
import 'package:boat_controller/ui/pages/controller_page.dart';
import 'package:boat_controller/ui/pages/connection_form_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // theme: ThemeData(
      //   textSelectionTheme: TextSelectionThemeData(
      //     selectionHandleColor: Colors.blue.shade300,
      //   ),
      // ),
      home: ConnectionProgresPage(),
    );
    // return const ControllerPage();
    // return const ConnectionProgresPage();
  }
}
