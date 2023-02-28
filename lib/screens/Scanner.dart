import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:qr_code/screens/attendance.dart';
import 'package:qr_code/models/attendee.dart';
import 'package:qr_code/services/getuserfromApi.dart';
import 'package:qr_code/services/isCheckedBefore.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


bool Progress =false;

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  String qrstr = 'let\s scan this';
  Future<void> scanQr() async {
    try {
      FlutterBarcodeScanner.scanBarcode('#2A99CF', 'Cancel', true, ScanMode.QR)
          .then((value) =>  {

        setState(()async {
          Progress=true;
          qrstr=value;
          try {
            Attendee attendee =
            await GetUserFromApi().getUser(id: qrstr );
            if (attendee == null) {
              qrstr = 'Attendee Not Found';
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Attendee Not Found",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 23, color: Colors.white),
                  ),
                  backgroundColor: Colors.amberAccent,
                ),
              );
              Progress=false;

            } else {
              if (await isScanned(code: value) == true){
                setState(() {
                  qrstr='Scanned before';
                });
              } else{

                addToFire(code: value);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Attendance(attendee: attendee),));
              Progress=false;
              }


            }
          }
          on SocketException catch (_) {
            qrstr='Please Connect To Internet ';
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Please Connect To Internet ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 23, color: Colors.white)),
              backgroundColor: Colors.red,
            ));
            Progress=false;

          }
          catch (e) {
            qrstr = 'not Valid qr';
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Enter Valid QR Code",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 23, color: Colors.white)),
              backgroundColor: Colors.blueAccent,
            ));
            Progress=false;

          }

        } )
      });
    } catch (e) {
      setState(() {
        qrstr = 'unable to scan this qr';
      });
      Progress=false;

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: Progress,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          title: Text('Qr'),
        ),
        backgroundColor: Colors.deepPurple,
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
          children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow()],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      qrstr,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.deepPurple),
                        ),
                        onPressed: scanQr,
                        child: Text(
                          'Scan',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
