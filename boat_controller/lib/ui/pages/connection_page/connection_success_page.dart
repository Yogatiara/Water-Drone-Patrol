import 'package:boat_controller/ui/font/app_font.dart';
import 'package:boat_controller/ui/pages/controller_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConnectionSuccessPage extends StatefulWidget {
  const ConnectionSuccessPage({super.key});

  @override
  State<ConnectionSuccessPage> createState() => _ConnectionSuccessPageState();
}

class _ConnectionSuccessPageState extends State<ConnectionSuccessPage> {
  late AppFonts appFonts;

  @override
  void initState() {
    super.initState();
    appFonts = AppFonts();
  }

  Future<void> getMonitoringConfiguration() async {
    final prefs = await SharedPreferences.getInstance();

    String locationValue = prefs.getString('location') ?? 'defaultLocation';
    String ipAddressValue = prefs.getString('ipAddress') ?? 'defaultIpAddress';

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ControllerPage(
          location: locationValue,
          ipAddress: ipAddressValue,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/icons/connection success.json',
                width: 350, height: 350),
            Text(
              'Connection success',
              style: appFonts.connectLabel("connection success"),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                getMonitoringConfiguration();
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromWidth(110),
                elevation: 3,
                backgroundColor: Colors.blue.shade300,
                shadowColor: Colors.blue.shade400,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Next',
                    style: AppFonts.buttonBackAndNext,
                  ),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
