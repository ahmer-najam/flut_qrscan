import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String qrResult = "Hello World";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Scanner"),
      ),
      body: Container(
        child: Center(
          child: Text("$qrResult"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera_alt_outlined), onPressed: scanQr),
    );
  }

  void scanQr() async {
    await Permission.camera.request();
    this.qrResult = await scanner.scan();
    setState(() {});
  }
}
