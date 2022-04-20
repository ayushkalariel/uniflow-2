import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uniflow/attendance.dart';
import 'package:uniflow/events.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'model/UserModel.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);
  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    //padding: EdgeInsets.all(10),
                    child: Text("${loggedInUser.FirstName}",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          fontSize: 26,
                        ))),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 180),
                    child: Icon(
                      Icons.notifications,
                      size: 30,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(
                      Icons.person,
                      size: 30,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 200, 10, 10),
                    child: SizedBox(
                      width: 185,
                      height: 185,
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
                              padding: EdgeInsets.only(top: 60),
                              child: Text(
                                "90%",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 55),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 30),
                              child: Text(
                                "Attendence",
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
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(10, 200, 0, 10),
                    child: SizedBox(
                      width: 185,
                      height: 185,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const events()));
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
                              padding: EdgeInsets.only(top: 60),
                              child: Text(
                                "5",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 55),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 30),
                              child: Text(
                                "Events",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: SizedBox(
                  width: 400,
                  height: 150,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const dashboard()));
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
                              "Upcoming",
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
                              "11 am - 12 pm",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: SizedBox(
                  width: 400,
                  height: 200,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const dashboard()));
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
                              "To-Do",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40),
                            )),
                        Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: Text(
                              "Assignment",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                        Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: Text(
                              "Assignment",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                        Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: Text(
                              "Assignment",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
