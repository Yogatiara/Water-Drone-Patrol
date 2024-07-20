import 'dart:developer';
import 'dart:async';

import 'package:boat_controller/model/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ControllerPage extends StatefulWidget {
  final String location, ipAddress;
  const ControllerPage(
      {super.key, required this.location, required this.ipAddress});

  @override
  State<ControllerPage> createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {
  Controller? controller;
  Color buttonColor = Colors.blue;
  Timer? _timer;
  String messValue = "OFF";
  String? ipAddress;
  String? location;
  bool isPressedLeft = false;
  bool isPressedRight = false;
  bool isPressedGas = false;
  bool isSwitched = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  void changeMessage() {
    setState(() {
      if (isSwitched) {
        messValue = "ON";
      } else {
        messValue = "OFF";
      }
    });
  }

  void handleOnPressed(direction, command) {
    log('succes: $direction');

    handleApiRequest(direction);
    _timer?.cancel();

    _timer = Timer(const Duration(milliseconds: 150), () {
      handleApiRequest(command);
      log('succes: $command');
    });
  }

  Future<void> handleApiRequest(path) async {
    log('succes: $path');
    try {
      Controller result = await Controller.getApi(path);
      setState(() {
        controller = result;
      });
      // log('API Response: ${result.data}');
    } catch (e) {
      log('Failed to load data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Water Drone Patrol Controller",
              style: GoogleFonts.firaSans(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              padding: const EdgeInsets.only(left: 5),
              decoration: const BoxDecoration(
                  border:
                      Border(left: BorderSide(width: 1, color: Colors.white))),
              child: Row(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_sharp,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        widget.location,
                        style: GoogleFonts.firaSans(
                            fontSize: 17, color: Colors.white),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/ip-address.png',
                        width: 23,
                        height: 23,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.ipAddress,
                        style: GoogleFonts.firaSans(
                            fontSize: 17, color: Colors.white),
                      ),
                      const SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromRGBO(93, 174, 255, 1.0),
        shadowColor: Colors.black54,
        elevation: 20,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextButton.icon(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue.shade300,
                ),
                icon: Icon(Icons.arrow_back, color: Colors.blue.shade300),
                label: Text(
                  'Back',
                  style: GoogleFonts.firaSans(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, '/connectionFormPage');
                },
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    // Switch
                    Container(
                      width: 240,
                      // height: 100,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(131, 187, 222, 251),
                        borderRadius:
                            BorderRadius.circular(15), // Radius sudut 15
                      ),
                      child: SwitchListTile(
                        title: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Detection ',
                                style: GoogleFonts.firaSans(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: messValue,
                                style: GoogleFonts.firaSans(
                                  fontWeight: FontWeight.bold,
                                  color: isSwitched ? Colors.green : Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                            changeMessage();
                          });
                          log('$isSwitched');
                        },
                        activeColor: Colors.blue,
                      ),
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
                        handleApiRequest('nogas');
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
          ],
        ),
      ),
    );
  }
}
