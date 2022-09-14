import 'package:flutter/material.dart';
import 'package:gtpl/provider_callback/plan_list.dart';
import 'package:gtpl/query/const.dart';
import 'package:gtpl/view/explore/tab/all.dart';
import 'package:gtpl/view/explore/filter.dart';

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0.0,
          title: const Center(
              child:
                  Text("Choose a Plan", style: TextStyle(color: Colors.black))),
        ),
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            spreadRadius: 2,
                            offset: Offset(
                              0,
                              0,
                            ),
                          ),
                        ],
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(10),
                      child: TabBar(
                          unselectedLabelColor: primaryColor,
                          labelStyle: TextStyle(fontSize: 12),
                          indicator: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          tabs: const [
                            Tab(
                              child: Text('All Plans'),
                            ),
                            Tab(
                              child: Text('Cable TV'),
                            ),
                            Tab(
                              child: Text('Broadband'),
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // Container(
                  //     height: 55,
                  //     decoration: BoxDecoration(
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.black.withOpacity(0.1),
                  //           blurRadius: 5,
                  //           spreadRadius: 2,
                  //           offset: Offset(
                  //             0,
                  //             0,
                  //           ),
                  //         ),
                  //       ],
                  //       color: whiteColor,
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     child: IconButton(
                  //       color: primaryColor,
                  //       onPressed: () {
                  //         showModalBottomSheet(
                  //             context: context,
                  //             builder: (context) {
                  //               return Filter();
                  //             });
                  //       },
                  //       icon: Icon(Icons.filter_list),
                  //     ))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              //   height: 55,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 2,
                    offset: Offset(
                      0,
                      0,
                    ),
                  ),
                ],
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: primaryColor),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) {
                        PlanListCallback(context).notListner.serachData(value);
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(0),
                        isDense: true,
                        border: InputBorder.none,
                        hintText: "Search with plan name",
                        hintStyle: TextStyle(color: greyColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 8),
              child: Text("Tap to renew",
                  style: TextStyle(
                      fontSize: 16,
                      color: primaryColor)),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  AllPlan(),
                  AllPlan(),
                  AllPlan(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
