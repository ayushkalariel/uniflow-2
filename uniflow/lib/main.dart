import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uniflow/dash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Form(
            child: SingleChildScrollView(
              reverse: true,
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 150.0),
                    child: Text(
                      "Welcome to Uniflow.",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 60,
                          )),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 70.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          fillColor: HexColor("#E7E7E7"),
                          filled: true,
                          hintText: "Roll no.",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  width: 0.0, style: BorderStyle.none)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(width: 2, color: Colors.black),
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          fillColor: HexColor("#E7E7E7"),
                          filled: true,
                          hintText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  width: 0.0, style: BorderStyle.none)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(width: 2, color: Colors.black),
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15.0, bottom: 20.0),
                    child: SizedBox(
                      width: 450,
                      height: 60,
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
                            borderRadius:
                            BorderRadius.all(Radius.circular(30))),
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
