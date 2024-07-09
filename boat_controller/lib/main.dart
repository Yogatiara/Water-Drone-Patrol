import 'package:boat_controller/ui/pages/connection_page/connection_progress_page.dart';
import 'package:boat_controller/ui/pages/connection_page/connection_form_page.dart';
import 'package:boat_controller/ui/pages/connection_page/connection_success_page.dart';
import 'package:flutter/material.dart';

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
    return MaterialApp(
      // theme: ThemeData(
      //   textSelectionTheme: TextSelectionThemeData(
      //     selectionHandleColor: Colors.blue.shade300,
      //   ),
      // ),
      home: const ConnectionFormPage(),
      routes: {
        '/connectionProgressPage': (context) => const ConnectionProgressPage()
      },
    );
    // return const ControllerPage();
    // return const ConnectionProgresPage();
  }
}
