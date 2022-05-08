import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uniflow/attendance.dart';

class events extends StatelessWidget {
  const events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text('Events',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                              fontSize: 26,
                            ))),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
