import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gtpl/query/const.dart';
import 'package:gtpl/view/quick_pay/subScreen/broadband.dart';
import 'package:gtpl/view/quick_pay/subScreen/cable.dart';

class QuickPay extends StatelessWidget {
  const QuickPay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              color: primaryColor,
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "QuickPay",
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Center(
                  child: Text(
                "Enter your details to recharge",
                style: TextStyle(color: greyColor),
              )),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 1,
                            spreadRadius: 2,
                            color: primaryColor.withOpacity(0.1))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: TabBar(
                      labelColor: Colors.white,
                      unselectedLabelColor: primaryColor,
                      indicator: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(50)),
                      tabs: [
                        Tab(
                          icon: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(Icons.live_tv),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Cable TV")
                            ],
                          ),
                        ),
                        Tab(
                          icon: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(Icons.indeterminate_check_box),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Broadband")
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
             const Expanded(
                child: TabBarView(
                  children: [
                  QuickCable(),
                  QuickBroadband(),
                ]),
              )
            ],
          ),
        ));
  }
}
