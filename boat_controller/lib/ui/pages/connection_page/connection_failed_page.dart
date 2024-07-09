import 'package:boat_controller/ui/font/app_font.dart';
import 'package:boat_controller/ui/pages/connection_page/connection_progress_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ConnectionFailedPage extends StatelessWidget {
  final String ipAddress;
  const ConnectionFailedPage({super.key, required this.ipAddress});

  @override
  Widget build(BuildContext context) {
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
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, '/connectionFormPage');
                    },
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
                    onPressed: () {
                      // Navigator.pushReplacementNamed(
                      //     context, '/connectionProgressPage');
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => ConnectionProgressPage(
                              id: ipAddress), // Kirim parameter id
                        ),
                      );
                    },
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
}
