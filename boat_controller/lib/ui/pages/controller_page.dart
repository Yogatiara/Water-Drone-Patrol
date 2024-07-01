import 'dart:developer';
import 'dart:async';

import 'package:boat_controller/model/controller.dart';
// import 'package:boat_controller/ui/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ControllerPage extends StatefulWidget {
  const ControllerPage({super.key});

  @override
  State<ControllerPage> createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {
  PostResult? postResult;
  bool isSwitched = false;
  Color buttonColor = Colors.blue;
  Timer? _timer;

  bool isPressedLeft = false;
  bool isPressedRight = false;
  bool isPressedGas = false;

  void handleOnPressed(direction, command) {
    log('succes: $direction');

    handleApiRequest(direction);
    _timer?.cancel();

    _timer = Timer(const Duration(milliseconds: 150), () {
      handleApiRequest(command);
      log('succes: $command');
    });
  }

  void handleApiRequest(path) async {
    log('succes: $path');
    try {
      PostResult result = await PostResult.connectToApi(path);
      setState(() {
        postResult = result;
      });
      log('API Response: ${result.data}');
    } catch (e) {
      log('Failed to load data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
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
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Column(
            children: [
              Container(
                width: 350,
                // height: 100,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(131, 187, 222, 251),
                  borderRadius: BorderRadius.circular(15), // Radius sudut 15
                ),
                // padding: const EdgeInsets.symmetric(horizontal: 250),
                child: SwitchListTile(
                  title: Text(
                    'Water Quality Detection',
                    style: GoogleFonts.firaSans(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                    log('$isSwitched');
                  },
                  activeColor: Colors.blue,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onLongPress: () {
                          setState(() {
                            isPressedLeft = true;
                          });
                          handleApiRequest('left');
                        },
                        onLongPressUp: () {
                          setState(() {
                            isPressedLeft = false;
                          });
                          handleApiRequest('idle');
                        },
                        child: ElevatedButton(
                          onPressed: () {
                            handleOnPressed('left', 'idle');
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith(
                                (states) {
                                  if (isPressedLeft) {
                                    return Colors.blue.shade100;
                                  } else if (!isPressedLeft) {
                                    return Colors.white;
                                  }
                                  return null;
                                },
                              ),
                              overlayColor: MaterialStateProperty.all(
                                  Colors.blue.shade100.withOpacity(0.5))),
                          child: Image.asset(
                            'assets/icons/arrow-left.png',
                            width: 80,
                            height: 80,
                          ),
                        ),
                      ),
                      // ),
                      const SizedBox(width: 30),
                      GestureDetector(
                        onLongPress: () {
                          setState(() {
                            isPressedRight = true;
                          });
                          handleApiRequest('right');
                        },
                        onLongPressUp: () {
                          setState(() {
                            isPressedRight = false;
                          });
                          handleApiRequest('idle');
                        },
                        child: ElevatedButton(
                            onPressed: () {
                              handleOnPressed('right', 'idle');
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) {
                                    if (isPressedRight) {
                                      return Colors.blue.shade100;
                                    } else if (!isPressedRight) {
                                      return Colors.white;
                                    }
                                    return null;
                                  },
                                ),
                                overlayColor: MaterialStateProperty.all(
                                    Colors.blue.shade100.withOpacity(0.5))),
                            child: Image.asset(
                              'assets/icons/arrow-right.png',
                              width: 80,
                              height: 80,
                            )),
                      ),
                    ],
                  ),
                  // Space between rows
                  GestureDetector(
                    onLongPress: () {
                      setState(() {
                        isPressedGas = true;
                      });
                      handleApiRequest('gas');
                    },
                    onLongPressUp: () {
                      setState(() {
                        isPressedGas = false;
                      });
                      handleApiRequest('idle');
                    },
                    child: ElevatedButton(
                      onPressed: () {
                        handleOnPressed("gas", "nogas");
                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(25)),
                          backgroundColor: MaterialStateProperty.resolveWith(
                            (states) {
                              if (isPressedGas) {
                                return Colors.blue.shade100;
                              } else if (!isPressedGas) {
                                return Colors.white;
                              }
                              return null;
                            },
                          ),
                          overlayColor: MaterialStateProperty.all(
                              Colors.blue.shade100.withOpacity(0.5))),
                      // style: ElevatedButton.styleFrom(
                      //     padding: const EdgeInsets.all(25)),
                      child: Image.asset(
                        'assets/icons/pedal.png',
                        width: 80,
                        height: 80,
                      ),
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
