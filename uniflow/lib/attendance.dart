import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class attendance extends StatelessWidget {
  const attendance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text('Attendance',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          fontSize: 26,
                        ))),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 200, 5, 10),
                    child: SizedBox(
                      width: 130,
                      height: 130,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const attendance()));
                          print("presssed");
                        },
                        color: Colors.black,
                        splashColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 40),
                              child: Text(
                                "119",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 50),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                "Attended",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 200, 5, 10),
                    child: SizedBox(
                      width: 130,
                      height: 130,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const attendance()));
                          print("presssed");
                        },
                        color: Colors.black,
                        splashColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 40),
                              child: Text(
                                "119",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 50),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                "Missed",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 200, 10, 10),
                    child: SizedBox(
                      width: 130,
                      height: 130,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const attendance()));
                          print("presssed");
                        },
                        color: Colors.black,
                        splashColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 40),
                              child: Text(
                                "119",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 50),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                "Total",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: SizedBox(
                  width: 400,
                  height: 150,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const attendance()));
                      print("presssed");
                    },
                    color: Colors.black,
                    splashColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(5, 20, 10, 0),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "90%",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                        Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.fromLTRB(5, 10, 10, 0),
                            child: Text(
                              "abc",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40),
                            )),
                        Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.fromLTRB(5, 10, 10, 0),
                            child: Text(
                              "9 OUT OF 10",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
