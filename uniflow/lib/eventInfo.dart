import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uniflow/attendance.dart';
import 'package:uniflow/events.dart';

class eventInfo extends StatelessWidget {
  const eventInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: [
      Column(children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text('Hackathon',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 26,
                  ))),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              child: Text("hello"),
            )
          ],
        )
      ])
    ]))));
  }
}
