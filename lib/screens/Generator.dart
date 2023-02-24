import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:qr_code/models/button.dart';
import 'package:qr_code/services/saveImage.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

class Generator extends StatefulWidget {
  const Generator({Key? key}) : super(key: key);

  @override
  State<Generator> createState() => _GeneratorState();
}

class _GeneratorState extends State<Generator> {
  TextEditingController t1 = TextEditingController();
  int _counter = 0;
  //Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text('Qr'),
      ),
      body: ListView(
        padding: EdgeInsets.all(35),
        children: [
          Center(
            child: Container(
              alignment: Alignment.center,
              width: 350,
              height: 450,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Screenshot(
                    controller: screenshotController,
                    child:Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          QrImage(
                            backgroundColor: Colors.white,
                            data: t1.text,
                            size: 200,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30,left: 30,top: 20),
                    child: TextFormField(
                      controller: t1,
                      onChanged: (v) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                          hintText: 'enter your data here',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                              borderRadius: BorderRadius.circular(15))),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: MyButton(
                      color: Colors.white,
                      text: 'Download',
                      onPressed: () async {
                        final pic = await screenshotController.capture();
                        if (pic != null) {
                          await saveImage(pic);
                          final snackBar = SnackBar(
                            content: const Text('Image Downloaded'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                // Some code to undo the change.
                              },
                            ),
                          );

                          // Find the ScaffoldMessenger in the widget tree
                          // and use it to show a SnackBar.
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          final snackBar = SnackBar(
                            content: const Text('Enter your Data'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                // Some code to undo the change.
                              },
                            ),
                          );
                          // Find the ScaffoldMessenger in the widget tree
                          // and use it to show a SnackBar.
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
