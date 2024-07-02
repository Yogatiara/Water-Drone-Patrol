import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  late Size mediaSize;

  String? valueChoose;
  final FocusNode focusNode = FocusNode();
  bool isFocused = false;
  List<String> listItem = [
    "Danau itk",
    "Waduk manggar",
    "Danau bpp",
    "test",
    "test",
    "test",
    "Test",
  ];
  TextEditingController ipAddress = TextEditingController();
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        isFocused = focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    ipAddress.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: const AssetImage('assets/images/lake.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop)),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(top: 80, child: buildTop()),
            Positioned(bottom: -5, right: -3, left: -3, child: buildBottom())
          ],
        ),
      ),
    );
  }

  Widget buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              width: 170,
              height: 170,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/WDP Logo Controller.png',
                    ),
                    fit: BoxFit.contain,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 3,
                      spreadRadius: 3,
                    )
                  ],
                  shape: BoxShape.circle)),
          const SizedBox(
            height: 20,
          ),
          Text("WDP CONTROLLER",
              style: GoogleFonts.firaSans(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 35,
                  letterSpacing: 1))
        ],
      ),
    );
  }

  Widget buildBottom() {
    return SizedBox(
        width: mediaSize.width,
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32), topRight: Radius.circular(32))),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: buildForm(),
          ),
        ));
  }

  Widget buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Monitoring Configuration",
          style: GoogleFonts.firaSans(
              fontSize: 25, fontWeight: FontWeight.w600, color: Colors.blue),
        ),
        buildText("Please fill out the form before using WDP", 15),
        const SizedBox(
          height: 40,
        ),
        Row(
          children: [
            const Icon(
              Icons.location_on_sharp,
              color: Colors.red,
              size: 30.0,
            ),
            const SizedBox(
              width: 5,
            ),
            buildText("Monitoring Location", 19),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        buildDropdownField(),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Image.asset(
              'assets/icons/ip-address.png',
              width: 30,
              height: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            buildText("Boat IP Address", 19),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        buildInputField(ipAddress),
        const SizedBox(
          height: 40,
        ),
        buildConnectButton()
      ],
    );
  }

  Widget buildText(String text, double fontSize) {
    return Text(text,
        style: GoogleFonts.firaSans(
            fontSize: fontSize, color: Colors.grey.shade800));
  }

  Widget buildInputField(TextEditingController controller) {
    return TextField(
      cursorColor: Colors.blue.shade300,
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: 'Example: 192.168.1.56:80',
        suffixIcon: Icon(
          Icons.done,
          color: isFocused ? Colors.blue : Colors.blue.shade300,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.blue.shade300,
              width: 1), // Warna garis bawah saat tidak fokus
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.blue, width: 2), // Warna garis bawah saat fokus
        ),
      ),
    );
  }

  Widget buildDropdownField() {
    return Container(
      padding: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.shade300, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButton(
        menuMaxHeight: 200,
        padding: const EdgeInsets.only(left: 10, right: 10),
        hint: Text(
          'choose location',
          style: GoogleFonts.firaSans(color: Colors.grey.shade800),
        ),
        isExpanded: true,
        iconSize: 30,
        iconEnabledColor: Colors.blue.shade300,
        underline: const SizedBox(),
        value: valueChoose,
        onChanged: (newValue) {
          setState(() {
            valueChoose = newValue;
          });
        },
        items: [
          ...listItem.map((valueItem) {
            return DropdownMenuItem(
              value: valueItem,
              child: Text(
                valueItem,
                style: GoogleFonts.firaSans(color: Colors.grey.shade800),
              ),
            );
          }),
          DropdownMenuItem(
            value: "1",
            enabled: false,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    String newLocation = '';
                    return AlertDialog(
                      title: buildText("Add Monitoring Location", 18),
                      content: TextField(
                        onChanged: (value) {
                          newLocation = value;
                        },
                        cursorColor: Colors.blue.shade300,
                        // controller: controller,
                        // focusNode: focusNode,
                        decoration: InputDecoration(
                          hintText: 'Example: Danau ITK',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blue.shade300,
                                width: 1), // Warna garis bawah saat tidak fokus
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2), // Warna garis bawah saat fokus
                          ),
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              if (newLocation.isNotEmpty) {
                                valueChoose = newLocation;
                                if (!listItem.contains(newLocation)) {
                                  listItem.add(newLocation);
                                }
                              }
                              Navigator.of(context).pop();
                            });
                          },
                          child: Text('Add',
                              style: GoogleFonts.firaSans(
                                  color: Colors.grey.shade800)),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                elevation: 5,
                backgroundColor: Colors.blue.shade300,
              ),
              child: Text('Add Location',
                  style: GoogleFonts.firaSans(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildConnectButton() {
    return ElevatedButton(
        onPressed: () {
          debugPrint('Test');
        },
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            elevation: 5,
            backgroundColor: Colors.blue.shade300,
            shadowColor: Colors.blue.shade400,
            minimumSize: const Size.fromHeight(60)),
        child: Text('CONNECT',
            style: GoogleFonts.firaSans(
                color: Colors.white, fontWeight: FontWeight.w400)));
  }
}
