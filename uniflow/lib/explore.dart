import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uniflow/attendance.dart';
import 'package:uniflow/eventInfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class explore extends StatelessWidget {
  const explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 200.0),
            child: Row(
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
                  child: Text('Explore',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        fontSize: 26,
                      ))),
                ),
              ],
            ),
          ),
          Container(
            child: Flexible(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("events")
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {}
                    return ListView(
                      children: snapshot.data!.docs.map((document) {
                        return Container(
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
                                        builder: (context) => eventInfo(
                                              EventName: document['EventName'],
                                              eid: document['eid'],
                                              imageUrl: document['imageUrl'],
                                            )));
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
                                      padding:
                                          EdgeInsets.fromLTRB(5, 20, 10, 0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Registered",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )),
                                  Container(
                                      alignment: Alignment.topLeft,
                                      padding:
                                          EdgeInsets.fromLTRB(5, 10, 10, 0),
                                      child: Text(
                                        document['EventName'],
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 40),
                                      )),
                                  Container(
                                      alignment: Alignment.topLeft,
                                      padding:
                                          EdgeInsets.fromLTRB(5, 10, 10, 0),
                                      child: Text(
                                        "9th April 2022 - 4pm",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }),
            ),
          ),
        ],
      ),
    ));
  }
}
