import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uniflow/api/sheets/registration_sheets_api.dart';
import 'package:uniflow/attendance.dart';
import 'package:uniflow/events.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'model/UserModel.dart';

class eventInfo extends StatefulWidget {
  String EventName;
  String eid;
  String imageUrl;
  eventInfo(
      {required this.EventName, required this.eid, required this.imageUrl});

  @override
  State<eventInfo> createState() =>
      _eventInfoState(EventName: EventName, eid: eid, imageUrl: imageUrl);
}

class _eventInfoState extends State<eventInfo> {
  final referenceDatabase = FirebaseDatabase.instance;
  final registeredEvents1 = FirebaseFirestore.instance
      .collection("users/POlXnGRhdDVYto5FapWhvGbOSDy2/registeredEvents");
  final database = FirebaseDatabase.instance.ref();
  User? user = FirebaseAuth.instance.currentUser;
  bool isactive = true;
  String fname = "";
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      fname = "${loggedInUser.FirstName}";
      _activateListener(fname);
      setState(() {});
    });
  }

  void _activateListener(String fname) {
    database
        .child(EventName + '/' + fname + '/registered')
        .onValue
        .listen((event) {
      final String check = event.snapshot.value.toString();
      setState(() {
        if (check == "true") {
          print(check);
          print(EventName + '/' + fname + '/registered');
          isactive = false;
        } else {
          print(check);
          print(EventName + '/' + fname + '/registered');
          isactive = true;
        }
      });
    });
  }

  String EventName;
  String eid;
  String imageUrl;
  _eventInfoState(
      {required this.EventName, required this.eid, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final ref = referenceDatabase.ref();
    var ref2 = FirebaseDatabase().ref().child(EventName);
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 30,
                ),
              ),
              Container(
                //padding: EdgeInsets.(10),
                child: Text(EventName,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: 26,
                    ))),
              )
            ],
          ),
          Column(
            children: [
              Container(
                  width: 400,
                  height: 600,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(imageUrl)),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Colors.redAccent,
                  )),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: SizedBox(
                  width: 400,
                  height: 150,
                  child: RaisedButton(
                    onPressed: () {},
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
                              "Description",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                        Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.fromLTRB(5, 10, 10, 0),
                            child: Text(
                              eid,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                        Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.fromLTRB(5, 10, 10, 0),
                            child: Text(
                              "9th April 2022 - 4pm",
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
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: SizedBox(
                      width: 400,
                      height: 60,
                      child: RaisedButton(
                          onPressed: isactive
                              ? () {
                                  ref
                                      .child(EventName)
                                      .child('${loggedInUser.FirstName}')
                                      .set({
                                    'roll': "${loggedInUser.roll}",
                                    'class': "${loggedInUser.Class}",
                                    'registered': 'true'
                                  }).asStream();
                                  registeredEvents1.add({
                                    'EventName': EventName,
                                    'eid': eid,
                                    'imageUrl': imageUrl
                                  });
                                }
                              : null,
                          color: Colors.black,
                          splashColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Column(children: [
                            Container(
                                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                alignment: Alignment.topCenter,
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ))
                          ]))))
            ],
          )
        ],
      ),
    )));
  }
}
