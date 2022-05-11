import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uniflow/dash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'uniflow',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: ''),
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
  final _FormKey = GlobalKey<FormState>();

  final TextEditingController rollController = new TextEditingController();
  final TextEditingController passController = new TextEditingController();

  final _auth = FirebaseAuth.instance;

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
              child: Form(
                key: _FormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 150.0),
                      child: Text(
                        "Welcome to Uniflow.",
                        style: GoogleFonts.raleway(
                            textStyle: TextStyle(
                          fontSize: 60,
                        )),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 70.0),
                      child: TextFormField(
                        controller: rollController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) return ("fields must be filled");
                        },
                        onSaved: (value) {
                          rollController.text = value!;
                        },
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
                      child: TextFormField(
                        controller: passController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) return ("fields must be filled");
                        },
                        onSaved: (value) {
                          passController.text = value!;
                        },
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
                            login(rollController.text, passController.text);
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
      ),
    );
  }

  void login(String roll, String pass) async {
    if (_FormKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: roll, password: pass)
          .then((uid) => {
                Fluttertoast.showToast(msg: "loged in"),
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const dashboard()))
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: "Incorrect credentials");
      });
    }
  }
}
