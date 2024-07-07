import 'package:boat_controller/ui/pages/font/app_font.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class ConnectionProgresPage extends StatelessWidget {
  const ConnectionProgresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return connectionSuccess();
  }

  Widget connectionProgres() {
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

  Widget connectionFailed() {
    AppFonts appFonts = AppFonts();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/icons/connection failed.json',
              width: 300,
              height: 300,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Connection failed',
              style: appFonts.connectLabel("connection failed"),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      elevation: 3,
                      backgroundColor: Colors.blue.shade300,
                      shadowColor: Colors.blue.shade400,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.arrow_back,
                          size: 25,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Back',
                          style: AppFonts.buttonBackAndNext,
                        ),
                      ],
                    )),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      elevation: 3,
                      fixedSize: const Size(10, 10),
                      backgroundColor: Colors.grey.shade500,
                      shadowColor: Colors.grey.shade500,
                    ),
                    child: const Icon(
                      Icons.refresh,
                      size: 30,
                      color: Colors.white,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget connectionSuccess() {
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
              onPressed: () {},
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
