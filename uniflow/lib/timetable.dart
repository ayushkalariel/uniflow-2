import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uniflow/attendance.dart';
import 'package:uniflow/eventInfo.dart';
import 'package:uniflow/explore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class timetable extends StatefulWidget {
  const timetable({Key? key}) : super(key: key);

  @override
  State<timetable> createState() => _timetableState();
}

class _timetableState extends State<timetable> with TickerProviderStateMixin {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 6, vsync: this);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 150.0),
            child: Row(
              children: [
                Container(
                    child: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 30,
                )),
                Container(
                  //padding: EdgeInsets.(10),
                  child: Text('Timetable',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        fontSize: 26,
                      ))),
                )
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                //labelPadding: EdgeInsets.only(left: 20, right: 20),
                //isScrollable: true,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50), // Creates border
                    color: Colors.black),
                tabs: [
                  Tab(text: "Mon"),
                  Tab(text: "Tue"),
                  Tab(text: "Wed"),
                  Tab(text: "Thur"),
                  Tab(text: "Fri"),
                  Tab(text: "Sat")
                ],
              ),
            ),
          ),
          Container(
            width: double.maxFinite,
            height: 500,
            child: TabBarView(controller: _tabController, children: [
              buildstructure("ttmonday"),
              buildstructure("tttuesday"),
              buildstructure("ttwednesday"),
              buildstructure("ttthursday"),
              buildstructure("ttfriday"),
              buildstructure("ttsaturday")
            ]),
          )
        ]),
      ),
    );
  }

  Widget buildstructure(String day) {
    return Container(
      child: Flexible(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(user!.uid)
                .collection(day)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {}
              return ListView(
                children: snapshot.data!.docs.map((document) {
                  return Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: SizedBox(
                          width: 400,
                          height: 100,
                          child: RaisedButton(
                            onPressed: () {},
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Column(
                              children: [
                                Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.fromLTRB(5, 10, 10, 0),
                                    child: Text(
                                      document['1'],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 40),
                                    )),
                                Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.fromLTRB(5, 10, 10, 0),
                                    child: Text(
                                      "9am - 10am",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
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
                          height: 100,
                          child: RaisedButton(
                            onPressed: () {},
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Column(
                              children: [
                                Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.fromLTRB(5, 10, 10, 0),
                                    child: Text(
                                      document['2'],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 40),
                                    )),
                                Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.fromLTRB(5, 10, 10, 0),
                                    child: Text(
                                      "10am - 11am",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
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
                          height: 100,
                          child: RaisedButton(
                            onPressed: () {},
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Column(
                              children: [
                                Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.fromLTRB(5, 10, 10, 0),
                                    child: Text(
                                      document['3'],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 40),
                                    )),
                                Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.fromLTRB(5, 10, 10, 0),
                                    child: Text(
                                      "11am - 12pm",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
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
                          height: 100,
                          child: RaisedButton(
                            onPressed: () {},
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Column(
                              children: [
                                Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.fromLTRB(5, 10, 10, 0),
                                    child: Text(
                                      document['4'],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 40),
                                    )),
                                Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.fromLTRB(5, 10, 10, 0),
                                    child: Text(
                                      "12pm - 1pm",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }).toList(),
              );
            }),
      ),
    );
  }
}
