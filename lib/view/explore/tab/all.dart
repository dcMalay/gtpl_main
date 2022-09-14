import 'package:flutter/material.dart';
import 'package:gtpl/const/const.dart';
import 'package:gtpl/provider/plan_list.dart';
import 'package:gtpl/provider_callback/plan_list.dart';
import 'package:gtpl/query/broadband/renew_broadband.dart';
import 'package:gtpl/query/const.dart';
import 'package:gtpl/query/gateway/ccavenue.dart';
import 'package:gtpl/query/global_handler.dart';
import 'package:gtpl/view/login/login.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class AllPlan extends StatefulWidget {
  const AllPlan({Key? key}) : super(key: key);

  @override
  State<AllPlan> createState() => _AllPlanState();
}

class _AllPlanState extends State<AllPlan> {
  var isAccountFound;
  @override
  void initState() {
    GlobalHandler.getBroadbandNo().then((value) {
      if (value != null) {
        PlanListCallback(context).notListner.getNull();
        PlanListCallback(context).notListner.getPlanList(context);

        setState(() {
          isAccountFound = true;
        });
      } else {
        setState(() {
          isAccountFound = false;
        });
      }
    });
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  CustomResultPlan? selectedPlan;
  @override
  Widget build(BuildContext context) {
    return isAccountFound == null
        ? const Center(child: CircularProgressIndicator())
        : isAccountFound == false
            ? Center(
                child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  width: 250,
                  height: 50,
                  child: const Center(
                    child: Text(
                      'Login Now',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ))
            : PlanListCallback(context).listner.resultFound == null
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    itemBuilder: (context, index) {
                      var ds =
                          PlanListCallback(context).listner.finalResult[index];
                      return Card(
                        margin: EdgeInsets.only(bottom: 10),
                        child: InkWell(
                          onTap: () async {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return SingleChildScrollView(
                                    child: Column(children: [
                                      Container(
                                        padding: const EdgeInsets.all(20),
                                        child: Text(
                                          "Please Select Payment Gateway",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Divider(
                                        height: 1,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          ccAvenue(ds);
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.all(20),
                                          child: Text(
                                            "CCAvenue",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          selectedPlan = ds;
                                          razorpay(ds);
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.all(20),
                                          child: Text(
                                            "Razorpay",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ]),
                                  );
                                });
                            // recharge(ds);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Text(ds.planName!,
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: greycolor,
                                        fontWeight: FontWeight.w400)),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text("Amount",
                                            style: TextStyle(
                                                fontSize: 11,
                                                color: greycolor,
                                                fontWeight: FontWeight.w400)),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text("Rs ${ds.amount}`",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: primaryColor,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("Validity",
                                            style: TextStyle(
                                                fontSize: 11,
                                                color: greycolor,
                                                fontWeight: FontWeight.w400)),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text("${ds.validity}",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: primaryColor,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("Data",
                                            style: TextStyle(
                                                fontSize: 11,
                                                color: greycolor,
                                                fontWeight: FontWeight.w400)),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text("${ds.volumeQuota}",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: primaryColor,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: PlanListCallback(context)
                        .notListner
                        .finalResult
                        .length);
  }

  Future<void> ccAvenue(CustomResultPlan ds) async {
    Navigator.pop(context);
    var details = await payCCavenue(
        context: context, amount: ds.amount!, name: ds.planName!);
    // Logger().d(details);
    if (details != null) {
      if (details['order_status'] == 'Success') {
        Navigator.pop(context);
        context.loaderOverlay.show();
        recharge(ds, "CCAvenue", details['details']['order_id']);
      }
    } else {
      customDialog(context, "Payment unsuccessfull", "Error in Renewing Plan");
    }
  }

  recharge(CustomResultPlan ds, String gateway, String transactionId) async {
    context.loaderOverlay.show();
    var getid = await GlobalHandler.getBroadbandNo();
    await renewPlan(
        context,
        ParamsRenewModel(
          activityName: "All Plan",
          userId: getid,
          planName: ds.planName,
          amount: ds.amount,
          description: ds.planName,
          paymentGatewayName: gateway,
          pGTransId: transactionId,
        )).then((value) {
      context.loaderOverlay.hide();

      if (value != null) {
        if (value.status == 200) {
          customDialog(context, "Success", "Plan Renewed Successfully");
        } else {
          errorDialog(context, "Error in Renewing Plan");
          // mesage = ;
        }
      }
    }).catchError((error) {
      context.loaderOverlay.hide();
      errorDialog(context, "SOmething Went Wrong");
    });
  }

  late Razorpay _razorpay;

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void razorpay(CustomResultPlan ds) async {
    var options = {
      'key': 'rzp_live_EzOfSBuBoB1d86',
      'amount': num.parse(ds.amount!) * 100,
      'name': "",
      'description': "Renew Plan GTPL",
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': "", 'email': ''},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Success Response: $response');
    Navigator.pop(context);
    Navigator.pop(context);
    recharge(selectedPlan!, "Razorpay", response.paymentId!);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
    // Navigator.pop(context);
    // Navigator.pop(context);
    Navigator.pop(context);
    customDialog(context, "Payment unsuccessfully", "Error in Renewing Plan");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
    // Navigator.pop(context);
    // Navigator.pop(context);
    Navigator.pop(context);
    customDialog(context, "Payment unsuccessfully", "Error in Renewing Plan");
  }
}

void errorDialog(BuildContext context, String message) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text("Done"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      });
}

void customDialog(BuildContext context, String title, String message) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text("Done"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      });
}
