import 'package:boat_controller/ui/font/app_font.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ConnectionSuccessPage extends StatelessWidget {
  const ConnectionSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppFonts appFonts = AppFonts();
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
                Navigator.pushReplacementNamed(context, '/controllerPage');
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
