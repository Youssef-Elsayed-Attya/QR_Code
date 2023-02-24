import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code/services/firebase_options.dart';
import 'package:qr_code/screens/splach.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));
  runApp(Home());}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int Index = 1;
  var TextData = 'null';
  final pages = [
    Container(
      width: 300,
      height: 350,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Text('Scan'),
    ),
    Container(
      alignment: Alignment.center,
      width: 300,
      height: 350,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          QrImage(
            data: '',
            size: 200,
            version: QrVersions.auto,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (v) {},
              decoration: InputDecoration(
                  hintText: 'enter your data here',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    ),
  ];
  TextEditingController t1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splach()
    );
  }
}
