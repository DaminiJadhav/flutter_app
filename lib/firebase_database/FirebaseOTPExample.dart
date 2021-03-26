import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/razorpay_example/RazorpayExample.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirebaseOTPExample extends StatefulWidget {
  @override
  _FirebaseOTPExampleState createState() => _FirebaseOTPExampleState();
}

class _FirebaseOTPExampleState extends State<FirebaseOTPExample> {

  TextEditingController phonenumbercontroller = TextEditingController();
  TextEditingController otpcontroller = TextEditingController();
  TextEditingController otptextcontroller = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String _verificationId;
  bool isCodeSent = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP"),
      ),
      body: _otpveriication(),
    );
  }


  Widget _otpveriication(){
    return Center(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              filled: true,
              labelText: "phone number",
            ),
            maxLines: 1,
            controller: phonenumbercontroller,
          ),
          RaisedButton(
            onPressed: () {
              _onVerifyCode();
            },
            child: Text("SAVE"),
          ),
          TextField(
            decoration: InputDecoration(
              filled: true,
              labelText: " otp",
            ),
            maxLines: 1,
            controller: otpcontroller,
            onChanged:(value){
              if(otpcontroller.text.length==6){
                _onFormSubmitted();
              }
            },
          ),
          RaisedButton(
            onPressed: () {
              // _showMyDialog();
              if(otpcontroller.text.length==6){
                _onFormSubmitted();
              }else{
                Fluttertoast.showToast(
                    msg: "Please Enter Correct OTP");
              }
            },
            child: Text("Verify"),
          ),
        ],
      ),
    );
  }


  void _onVerifyCode() async {
    setState(() {
      isCodeSent = true;
    });
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) {
      _firebaseAuth
          .signInWithCredential(phoneAuthCredential)
          .then((UserCredential value) {
        if (value.user != null) {
          // Handle loogged in state
          print(value.user.phoneNumber);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => RazorpayExample(),
              ),
                  (Route<dynamic> route) => false);
        } else {
          Fluttertoast.showToast(
              msg: "Error validating OTP, try again: ");
        }
      }).catchError((error) {
        Fluttertoast.showToast(
            msg: "Try again in sometime");
      });
    };
    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
          Fluttertoast.showToast(
              msg:authException.message);

      setState(() {
        isCodeSent = false;
      });
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      _verificationId = verificationId;
      setState(() {
        _verificationId = verificationId;
      });
      if(_verificationId!=null){
        _showMyDialog();
      }

    };
    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationId = verificationId;
      setState(() {
        _verificationId = verificationId;
      });
    };

    // TODO: Change country code

    try{
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: "+91${phonenumbercontroller.text}",
          timeout: const Duration(seconds: 60),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    }catch(e){
      print(e.toString());
    }

  }


  void _onFormSubmitted() async {
    // AuthCredential _authCredential = PhoneAuthProvider.getCredential(
    //     verificationId: _verificationId, smsCode: otpcontroller.text);

    AuthCredential _authCredential = PhoneAuthProvider.getCredential(
        verificationId: _verificationId, smsCode: otptextcontroller.text);

    _firebaseAuth
        .signInWithCredential(_authCredential)
        .then((UserCredential value) {
      if (value.user != null) {
        // Handle loogged in state
        print(value.user.phoneNumber);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => RazorpayExample(),
            ),
                (Route<dynamic> route) => false);
      } else {
        Fluttertoast.showToast(
            msg: "Error validating OTP, try again: ");
        Navigator.of(context).pop();

      }
    }).catchError((error) {
      Fluttertoast.showToast(
          msg: "Something went wrong ");
      Navigator.of(context).pop();

    });
  }



  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Otp verify'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    labelText: " otp",
                  ),
                  maxLines: 1,
                  controller: otptextcontroller,
                  onChanged:(value){
                    // if(otpcontroller.text.length==6){
                    //   _onFormSubmitted();
                    // }
                  },
                ),
                // Text('This is a demo alert dialog.'),
                // Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Verify'),
              onPressed: () {
                if(otptextcontroller.text.length==6){
                  _onFormSubmitted();
                  // Navigator.of(context).pop();

                }else{
                  Fluttertoast.showToast(
                      msg: "Please Enter Correct OTP");
                }
              },
            ),
          ],
        );
      },
    );
  }

}
