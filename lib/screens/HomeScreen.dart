import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code/screens/Generator.dart';
import 'package:qr_code/screens/Scanner.dart';
import 'package:qr_code/screens/attendance.dart';
import 'package:qr_code/models/button.dart';
import 'package:http/http.dart'as http;
import 'package:qr_code/models/attendee.dart';
import 'package:qr_code/services/getuserfromApi.dart';
class Mainscreen extends StatefulWidget {
  const Mainscreen({Key? key}) : super(key: key);

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {




  int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.deepPurple),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.deepPurple,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(color: Colors.white, text: 'Generate', onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Generator()))),
            MyButton(color: Colors.white, text: 'Scan', onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Scanner()))),
            // MyButton(color: Colors.white, text: 'print', onPressed: ()async {
            //
            //    Attendee att=await GetUserFromApi().getUser(id:'IEEE MIND-GAME042214351');
            //    Navigator.push(context, MaterialPageRoute(builder: (context) => Attendance(attendee: att),));
            //
            // }),
            ],
        ),
      ),
    );
  }
}
