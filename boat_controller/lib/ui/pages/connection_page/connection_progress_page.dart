import 'dart:developer';

import 'package:boat_controller/model/controller.dart';
import 'package:boat_controller/ui/font/app_font.dart';
import 'package:boat_controller/ui/pages/connection_page/connection_failed_page.dart';
import 'package:boat_controller/ui/pages/connection_page/connection_success_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class ConnectionProgressPage extends StatefulWidget {
  const ConnectionProgressPage({super.key});

  @override
  State<ConnectionProgressPage> createState() => _ConnectionProgressPageState();
}

class _ConnectionProgressPageState extends State<ConnectionProgressPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    // try {
    // await Controller.getApi();

    handleApiRequest();
  }

  void handleApiRequest() async {
    try {
      await Controller.getApi();
      log('Success api');
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const ConnectionSuccessPage()));
      });
      // log('API Response: ${result.data}');
    } catch (e) {
      log('Failed to load data: $e');
      Future.delayed(const Duration(seconds: 7), () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const ConnectionFailedPage()));
      });
    }
  }

  // @override
  // void dispose() {
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //       overlays: SystemUiOverlay.values);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    AppFonts appFonts = AppFonts();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/icons/connection.json',
                width: 350, height: 350),
            Text(
              'Connect to ship....',
              style: appFonts.connectLabel("connection progres"),
            )
          ],
        ),
      ),
    );
  }
}
