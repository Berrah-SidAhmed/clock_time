import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Test1(),
    );
  }
}

class Test1 extends StatefulWidget {
  const Test1({super.key});

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  String timenow = "";
  Timer? period;
  Duration duration = Duration(milliseconds: 0);

  counter() {
    period = Timer.periodic(Duration(milliseconds: 1), (timer) {
      setState(() {
        // newduration = duration.inSeconds + 1;
        int newseconde = duration.inMilliseconds + 1;
        duration = Duration(milliseconds: newseconde);
      });
    });
  }

  changetime() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        timenow = DateFormat.jm().format(DateTime.now());
      });
    });
  }

  // ignore: non_constant_identifier_names, use_function_type_syntax_for_parameters
  void initState() {
    // TODO: implement setState
    super.initState();
    changetime();
  }

  bool isRanning = false;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        shadowColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 3,
        title: Text(
          "CLOCK AND TIMER",
          style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white60),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              timenow,
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 110,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'hamoda'),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Counter",
              style: TextStyle(
                  fontFamily: "hamoda", fontSize: 80, color: Colors.white),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 7,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      duration.inMinutes
                          .remainder(60)
                          .toString()
                          .padLeft(2, '0'),
                      style: TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.w300,
                          color: Colors.white38),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      duration.inSeconds
                          .remainder(60)
                          .toString()
                          .padLeft(2, '0'),
                      style: TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.w300,
                          color: Colors.white38),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      duration.inMilliseconds
                          .remainder(60)
                          .toString()
                          .padLeft(2, '0'),
                      style: TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.w300,
                          color: Colors.white38),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            isRanning
                // ignore: dead_code
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            
                            if (period!.isActive) {
                              period!.cancel();
                            }else{
                              counter();
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.black),
                              elevation: WidgetStatePropertyAll(7),
                              shadowColor: WidgetStatePropertyAll(Colors.blue)),
                          child: Container(
                              width: 90,
                              height: 50,
                              child: Center(
                                  child: Text(
                                (period!.isActive)?"Stop" : "resume",
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.white54,
                                    fontWeight: FontWeight.w300),
                              )))),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            period!.cancel();
                            duration = Duration(milliseconds: 0);
                            isRanning = false;
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.black),
                              elevation: WidgetStatePropertyAll(7),
                              shadowColor: WidgetStatePropertyAll(Colors.blue)),
                          child: Container(
                              width: 90,
                              height: 50,
                              child: Center(
                                  child: Text(
                                "Close",
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.white54,
                                    fontWeight: FontWeight.w300),
                              )))),
                    ],
                  )
                : ElevatedButton(
                    onPressed: () {
                      counter();
                      setState(() {
                        isRanning = true;
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.black),
                        elevation: WidgetStatePropertyAll(7),
                        shadowColor: WidgetStatePropertyAll(Colors.blue)),
                    child: Container(
                        width: 150,
                        height: 60,
                        child: Center(
                            child: Text(
                          "Start Timer",
                          style: TextStyle(
                              fontSize: 28,
                              color: Colors.white54,
                              fontWeight: FontWeight.w300),
                        )))),
          ],
        ),
      ),
    );
  }
}
