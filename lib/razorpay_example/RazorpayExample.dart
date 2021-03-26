import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayExample extends StatefulWidget {
  @override
  _RazorpayExampleState createState() => _RazorpayExampleState();
}

class _RazorpayExampleState extends State<RazorpayExample> {


  Razorpay razorpay=new Razorpay();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpayEvent();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() async{
    var options={
      'key': 'rzp_test_YJtz6zRwcC0RyS',
      'amount' : 100.00,
      'name': 'Damini',
      'description':'rezorpay demo',
      'prefill':{'contact':'7057328572','email':"damini@gmail.com"},
      'external':{
        "wallets":['paytm']
      }
    };


    try{
      razorpay.open(options);
    }catch(e){
      debugPrint(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Razorpay"),
      ),
      body: Container(
        child:RaisedButton(
          onPressed: (){
            openCheckout();
          },
          child: Text("Pay"),
        ),
      ),
    );
  }


  void _razorpayEvent(){
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

  }


  void _handlePaymentSuccess(PaymentSuccessResponse response){
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId,);
  }

  void _handlePaymentError(PaymentFailureResponse response){
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message,
      );
  }

  void _handleExternalWallet(ExternalWalletResponse response){
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName);
  }
}
