import 'dart:collection';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/FlutterExample.dart';
import 'package:flutter_app/razorpay_example/RazorpayExample.dart';

class MyFirebaseDemo extends StatefulWidget {
  @override
  _MyFirebaseDemoState createState() => _MyFirebaseDemoState();
}

class _MyFirebaseDemoState extends State<MyFirebaseDemo> {

  final firebaseInstance = FirebaseFirestore.instance;
  final myController = TextEditingController();
  final name = "Damini";
 Map<String,dynamic> data=new Map();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Firebase"),
        ),
        body: _adddata()
    );
  }


  Widget _adddata() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: RaisedButton(
                  child: Text("Add"),
                  onPressed: () {
                    _firebaseuserdata("users");
                  },
                ),
              ),
              Expanded(
              child:
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: RaisedButton(
                  child: Text("Fetch Data"),
                  onPressed: () {
                    // _getuserdata();
                    // _getuserdata1();
                    fetchdata();
                  },
                ),
              ),
             ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: RaisedButton(
                    child: Text("Delete"),
                    onPressed: () {
                       deleteData();
                    },
                  ),
                ),
              ),
              Expanded(
                child:
                Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: RaisedButton(
                  child: Text("Update"),
                  onPressed: () {
                    updateData();
                  },
                ),
              ),
              ),
              Expanded(
                child:
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: RaisedButton(
                    child: Text("add db"),
                    onPressed: () {

                      _firebaseuserdata("Employee");

                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: data!=null ? Text(data.toString()) : Text("data null"),
          )
        ],
      ),
    );
  }


  Future<dynamic> _firebaseuserdata(String db) async {
    return await firebaseInstance.collection(db).add(
        {
          // "id":1,
          "name": "SHIVRAJ",
          "phoneNumber": "9657431430",
          "address": {
            "street": "pune",
            "city": "pune"
          },
          "dateofbirth":"13/06/2001",
          "education":" FY  BCS"
        }
    ).then((value) => print("UserId :" + value.id));
  }

  Future<dynamic> _getuserdata() async {
    QuerySnapshot qn = await firebaseInstance.collection("users")
        .getDocuments();
    print("User Data : ${qn.documents.length}");
    qn.documents.forEach((element) {
      print("${qn.documents.toString()}");
    });


    //  await  firebaseInstance
    //     .collection("users")
    //     .getDocuments()
    //     .then((QuerySnapshot snapshot) {
    //   snapshot.documents.forEach((f) => print('User Data ${f.data}}'));
    // });

  }


  Future<bool> _getuserdata1() async {
    final QuerySnapshot result = await Firestore.instance
        .collection('users')
        .getDocuments();
    final List<DocumentSnapshot> documents = result.documents;
    print("User Data"+documents.toString());
    if (documents.length > 0) {
      return
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RazorpayExample()));
    } else {
      return
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    FlutterExample()));
    }
  }

  fetchdata(){
    CollectionReference collectionReference=firebaseInstance.collection("users");
    collectionReference.snapshots().listen((event) {
      setState(() {
        data=event.documents[0].data();
        print("${event.documents.length}");
        print("user data ${data}");
      });
    });
  }

  deleteData() async{
    CollectionReference collectionReference=firebaseInstance.collection('users');
    QuerySnapshot snapshot=await collectionReference.getDocuments();
    snapshot.documents[0].reference.delete();
  }


  updateData() async{
    CollectionReference collectionReference=firebaseInstance.collection('users');
    QuerySnapshot snapshot=await collectionReference.getDocuments();
    snapshot.documents[0].reference.updateData({"name":"Raj"});
  }
}