import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';
import 'package:gtpl/query/const.dart';
import 'package:gtpl/query/get_payment_details.dart';

class CcAvenuePaymentGateway extends StatefulWidget {
  final String amount;
  final String orderId;
  final String name;

  const CcAvenuePaymentGateway(
      {super.key,
      required this.amount,
      required this.orderId,
      required this.name});
  @override
  CcAvenuePaymentGatewayState createState() => CcAvenuePaymentGatewayState();
}

class CcAvenuePaymentGatewayState extends State<CcAvenuePaymentGateway> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  var token = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: whiteColor,
          leading: CloseButton(
            color: blackColor,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Are you sure you want to cancel?"),
                      actions: <Widget>[
                        TextButton(
                          child: Text("Yes"),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: Text("No"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  });
            },
          ),
          title: Text(
            "Payment Gateway",
            style: TextStyle(color: blackColor),
          ),
        ),
        body: WebView(
          javascriptChannels: [
            JavascriptChannel(
                name: 'CHANNEL_NAME',
                onMessageReceived: (message) {
                  token = message.message;
                  getTokenDetails();
                })
          ].toSet(),
          onWebViewCreated: (WebViewController controller) {
            // controller.evaluateJavascript('fromFlutter("pop")');
          },
          initialUrl: base_url +
              '/payment/ccav/${widget.orderId}/${widget.amount}/${widget.name}',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }

  getTokenDetails() {
    getPaymentDetails(context, token).then((value) {
      if (value!['decode']['order_status'] == "Success") {
        Navigator.pop(context, {
          "order_status": value['decode']['order_status'],
          "details": value['decode'],
        });
      }
    });
  }
}

Future<dynamic> payCCavenue({
  required BuildContext context,
  required String amount,
  required String name,
}) async {
  var details = await Navigator.push(context, MaterialPageRoute(
    builder: (context) {
      return CcAvenuePaymentGateway(
          amount: amount,
          orderId: DateTime.now().millisecondsSinceEpoch.toString(),
          name: name);
    },
  ));
  return details;
}
