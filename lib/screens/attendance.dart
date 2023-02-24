import 'package:flutter/material.dart';
import 'package:qr_code/models/attendee.dart';

class Attendance extends StatelessWidget {
  final Attendee attendee;

  const Attendance({Key? key, required this.attendee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text('Attendance'),
      ),
      backgroundColor: Colors.deepPurple,
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
        children: [
          Center(
            child: SingleChildScrollView(
              child: Container(
                width: 600,
                height: 600,
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow()],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Name :',
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(229, 238, 245, 1)),
                        child: Center(child: Text(attendee.name)),
                      ),
                      Text(
                        'ID :',
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(229, 238, 245, 1)),
                        child: Center(child: Text(attendee.id)),
                      ),
                      Text(
                        'Attendee Code :',
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(229, 238, 245, 1)),
                        child: Center(child: Text(attendee.attendeeCode)),
                      ),
                      Text(
                        'Email :',
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(229, 238, 245, 1)),
                        child: Center(child: Text(attendee.email)),
                      ),
                      Text(
                        'phone :',
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(229, 238, 245, 1)),
                        child: Center(child: Text(attendee.phone)),
                      ),
                      Text(
                        'age :',
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(229, 238, 245, 1)),
                        child: Center(child: Text(attendee.age)),
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
