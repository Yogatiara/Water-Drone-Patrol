import 'dart:developer';

import 'package:boat_controller/ui/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ControllerPage extends StatefulWidget {
  const ControllerPage({super.key});

  @override
  State<ControllerPage> createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const AppBarWidget(),
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 290),
                child: SwitchListTile(
                  title: Text(
                    'Quality water detection',
                    style: GoogleFonts.firaSans(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeColor: Colors.blue,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onLongPress: () {
                          log('left');
                        },
                        child: ElevatedButton(
                          child: Image.asset(
                            'assets/icons/arrow-left.png',
                            width: 80,
                            height: 80,
                          ),
                          onPressed: () {
                            log('left');
                          },
                        ),
                      ),
                      const SizedBox(width: 30),
                      GestureDetector(
                        onLongPress: () {
                          log('right');
                        },
                        child: ElevatedButton(
                          child: Image.asset(
                            'assets/icons/arrow-right.png',
                            width: 80,
                            height: 80,
                          ),
                          onPressed: () {
                            log('right');
                          },
                        ),
                      ),
                    ],
                  ),
                  // Space between rows
                  GestureDetector(
                    onLongPress: () {
                      log('gas');
                    },
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(25)),
                      child: Image.asset(
                        'assets/icons/pedal.png',
                        width: 80,
                        height: 80,
                      ),
                      onPressed: () {
                        log('gas');
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
