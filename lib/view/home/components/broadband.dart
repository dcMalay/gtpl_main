import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gtpl/provider/home.dart';
import 'package:gtpl/query/const.dart';
import 'package:gtpl/query/get_broad_details.dart';
import 'package:gtpl/query/global_handler.dart';
import 'package:gtpl/view/quick_pay/quick_pay.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class BroadbandCard extends StatelessWidget {
  final GetBroadbandDetailsModel? dsBroadband;
  const BroadbandCard({Key? key, this.dsBroadband}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 10,
        shadowColor: primaryColor.withOpacity(0.2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.only(top: 20),
        child: Container(
          width: 283,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFFE0EBF8),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )),
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/broadband.png'),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Broadband',
                      style: TextStyle(
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              dsBroadband!.resultUserDetail!.status == "Active"
                  ? Container(
                      padding: EdgeInsets.all(5),
                      color: greenColor.withOpacity(0.2),
                      child: Center(
                        child: Text(
                          'Plan Active',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: greenColor.withOpacity(0.5),
                          ),
                        ),
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.all(5),
                      color: Color(0xFFE5312C).withOpacity(0.2),
                      child: Center(
                        child: Text(
                          'Plan expired',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFE5312C).withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          CircularPercentIndicator(
                            progressColor:
                                dsBroadband!.resultUserDetail!.status ==
                                        "Active"
                                    ? Colors.green.withOpacity(0.7)
                                    : Colors.red.withOpacity(0.7),
                            radius: 30,
                            lineWidth: 5,
                            animation: true,
                            percent: 1,
                            center: Text(
                              "UL",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  // color: Color(0xFFE5312C),
                                  color:
                                      dsBroadband!.resultUserDetail!.status ==
                                              "Active"
                                          ? Colors.green.withOpacity(0.7)
                                          : Colors.red.withOpacity(0.7),
                                  fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Data left',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: greyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          CircularPercentIndicator(
                            progressColor:
                                dsBroadband!.resultUserDetail!.status ==
                                        "Active"
                                    ? Colors.green.withOpacity(0.7)
                                    : Colors.red.withOpacity(0.7),
                            radius: 30,
                            lineWidth: 5,
                            animation: true,
                            percent: 1,
                            center: Text(
                              DateTime.parse(dsBroadband!
                                      .resultUserDetail!.expiryDate!)
                                  .difference(DateTime.now())
                                  .inDays
                                  .toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color:
                                      dsBroadband!.resultUserDetail!.status ==
                                              "Active"
                                          ? Colors.green.withOpacity(0.7)
                                          : Colors.red.withOpacity(0.7),
                                  fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Expiry Days',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: greyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          CircularPercentIndicator(
                            progressColor:
                                dsBroadband!.resultUserDetail!.status ==
                                        "Active"
                                    ? Colors.green.withOpacity(0.7)
                                    : Colors.red.withOpacity(0.7),
                            radius: 30,
                            lineWidth: 5,
                            animation: true,
                            percent: 1,
                            center: Text(
                              "₹" + dsBroadband!.getSubscriberDetail!.amount!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color:
                                      dsBroadband!.resultUserDetail!.status ==
                                              "Active"
                                          ? Colors.green.withOpacity(0.7)
                                          : Colors.red.withOpacity(0.7),
                                  fontSize: 11),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            dsBroadband!.resultUserDetail!.currentPlanName!,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: greyColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Card(
                elevation: 3,
                color: primaryColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: InkWell(
                    onTap: () {
                      GlobalHandler.navigatorPush(context, const QuickPay());
                    },
                    child: Text(
                      "Recharge".toUpperCase(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              InkWell(
                onTap: () {
                  Provider.of<HomeProvider>(context, listen: false)
                      .chnageScreen(2);
                },
                child: Text(
                  'View plan details',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: greyColor.withOpacity(0.8),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
