import 'dart:ffi';
import 'dart:io';

import 'package:pdf/widgets.dart' as pw;

import 'package:flutter/material.dart';

class pdfScreen extends StatefulWidget {
  @override
  _pdfScreenState createState() => _pdfScreenState();
}

class _pdfScreenState extends State<pdfScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("pdf"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("DOWNLOAD"),
          onPressed: (){
            pdffiledownload();
          },
        ),
      ),
    );
  }


  Future<Void> pdffiledownload() async{
    final pdf = pw.Document();
    pdf.addPage(pw.Page(
      build: (pw.Context context)=>pw.Center(
        child: pw.Text("Hello World"),
      )
    ));

    final file=File("flutterpdfapp/example.pdf");
    await file.writeAsBytes(await pdf.save());

  }
}
