import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gtpl/api_layer/networking.dart';
import 'package:gtpl/api_layer/models/ticket_model.dart';
import 'package:gtpl/query/const.dart';
import 'package:gtpl/view/help/components/rating_bar.dart';

class PastTickets extends StatefulWidget {
  const PastTickets({super.key});

  @override
  State<PastTickets> createState() => _PastTicketsState();
}

class _PastTicketsState extends State<PastTickets> {
  var isExpanded = false;

  late Future<List<UserTicket>> futureData;

  @override
  void initState() {
    super.initState();
    setState(() {
      futureData = fetchTicketData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 900,
      child: FutureBuilder<List<UserTicket>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<UserTicket>? data = snapshot.data;
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data!.length,
              itemBuilder: (context, index) {
                var str = data[index].createdAt.toString();
                var parts = str.split(' ');
                var createdDate = parts[0].trim();
                // print(' previous:$str');
                // print(createdDate);
                return Card(
                  elevation: 1,
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              " Ticket No: ${data[index].id}", //'Ticket No-1947034',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: blackColor,
                              ),
                            ),
                            Text(
                              createdDate,
                              // '05-12-2020',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: greyColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Tracking number:n\IW3475453455',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: greyColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: InkWell(
                                onTap: () {
                                  //to show a dialog for description details
                                  showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                      scrollable: true,
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "Ticket Details :",
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: primaryColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          SelectableText(
                                            "No:${data[index].id}",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            "Issue :${data[index].issueType}",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: blackColor,
                                            ),
                                          ),
                                          Text(
                                            "Description :",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: blackColor,
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 6,
                                          // ),
                                          // InkWell(
                                          //   onTap: () {
                                          //     Navigator.pop(context);
                                          //   },
                                          //   child: Icon(
                                          //     Icons.close,
                                          //     color: primaryColor,
                                          //     size: 30,
                                          //   ),
                                          // )
                                        ],
                                      ),
                                      content: SizedBox(
                                        height: 150,
                                        width: 100,
                                        child: Scrollbar(
                                          thumbVisibility: true,
                                          child: ListView(
                                            children: [
                                              Text(data[index].description)
                                            ],
                                          ),
                                        ),
                                      ),
                                      actions: [
                                        Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 10),
                                              decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                              ),
                                              child: InkWell(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (ctx) =>
                                                        AlertDialog(
                                                      content: SizedBox(
                                                        height: 100,
                                                        width: 100,
                                                        child: Center(
                                                          child: Text(
                                                            'Please wait for 48 hours to re-submit the issue',
                                                            style: TextStyle(
                                                              color:
                                                                  primaryColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Text(
                                                  'Re-submit Issue',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: whiteColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 40,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 10),
                                              decoration: BoxDecoration(
                                                color: primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                              ),
                                              child: InkWell(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (ctx) => SizedBox(
                                                      height: 100,
                                                      width: 100,
                                                      child: AlertDialog(
                                                        title: Text(
                                                          'Close the Ticket',
                                                          style: TextStyle(
                                                            color: primaryColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        content: Text(
                                                          'Are you want to close the ticket?',
                                                          style: TextStyle(
                                                            color: blackColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text(
                                                              'No',
                                                              style: TextStyle(
                                                                color:
                                                                    primaryColor,
                                                              ),
                                                            ),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              closeTicket(
                                                                  data[index]
                                                                      .id);

                                                              Navigator.pop(
                                                                  context);
                                                              showDialog(
                                                                  context:
                                                                      context,
                                                                  builder: (ctx) =>
                                                                      StarRating(
                                                                          ticketId:
                                                                              data[index].id));
                                                              setState(() {
                                                                futureData =
                                                                    fetchTicketData();
                                                              });
                                                            },
                                                            child: Text(
                                                              'Yes',
                                                              style: TextStyle(
                                                                color:
                                                                    primaryColor,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                  Future.delayed(
                                                      const Duration(
                                                        seconds: 8,
                                                      ), () {
                                                    Navigator.pop(context);
                                                  });
                                                },
                                                child: Text(
                                                  'Close the Ticket',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: whiteColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                  // Navigator.pop(context);
                                },
                                child: Text(
                                  // data[index].description,
                                  'description',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              data[index].isclosed == 0
                                  ? data[index].status
                                  : "closed",
                              // 'In-process',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: data[index].isclosed == 0
                                    ? greenColor
                                    : redColor,
                              ),
                            ),
                          ],
                        ),
                        // check kr rhe hai ki agar true ha to details shw kre wrna nh kare
                        isExpanded
                            ? // iska mtlb hota ha true
                            Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Issue raised:',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: greyColor,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          data[index].issueType,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: greyColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      //to show a dialog for description details
                                      showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          scrollable: true,

                                          // title: Row(
                                          //   mainAxisSize: MainAxisSize.min,
                                          //   children: [
                                          //     Text(
                                          //       data[index].id,
                                          //       style: TextStyle(fontSize: 17),
                                          //     ),
                                          //     SizedBox(
                                          //       width: 6,
                                          //     ),
                                          //     InkWell(
                                          //       onTap: () {
                                          //         Navigator.pop(context);
                                          //       },
                                          //       child: Icon(
                                          //         Icons.close,
                                          //         color: primaryColor,
                                          //         size: 30,
                                          //       ),
                                          //     )
                                          //   ],
                                          // ),
                                          title: Column(
                                            children: [
                                              Text(
                                                'Ticket Details :',
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  color: primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "Tk No :${data[index].id}",
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  color: primaryColor,
                                                ),
                                              ),
                                              Text(
                                                "Issue :${data[index].issueType}",
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  color: primaryColor,
                                                ),
                                              ),
                                            ],
                                          ),

                                          content: SizedBox(
                                            height: 150,
                                            width: 100,
                                            child: Scrollbar(
                                              child: ListView(
                                                children: [
                                                  Text(
                                                    "Description",
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      color: primaryColor,
                                                    ),
                                                  ),
                                                  Text(data[index].description),
                                                ],
                                              ),
                                            ),
                                          ),
                                          actions: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 10),
                                              decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                              ),
                                              child: InkWell(
                                                onTap: () {},
                                                child: Text(
                                                  'Re-submit Issue',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: whiteColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 40,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 10),
                                              decoration: BoxDecoration(
                                                color: primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                              ),
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  'Close the Ticket',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: whiteColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Description:',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: greyColor,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            data[index].description,
                                            // 'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. ',
                                            softWrap: true,
                                            maxLines: 3,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: greyColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : // iska mtlb hota ha false
                            Container()
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } // By default show a loading spinner.
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}




// class Ticket extends StatefulWidget {
//   const Ticket({Key? key}) : super(key: key);

//   @override
//   State<Ticket> createState() => _TicketState();
// }

// class _TicketState extends State<Ticket> {
//   // ye ek variable bool jsime hum true or false kr rha ehai ha ya na
//   var isExpanded = false;

//   late Future<List<UserTicket>> futureData;

//   @override
//   void initState() {
//     super.initState();
//     futureData = fetchData();
//     print(futureData);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       // main yaha 10 islye diya mujhe upar ka bhi shape lana tha wahi ni hora mujhse.abhi 10.30 hora tym.
//       // 1 elevation add hua h
//       elevation: 1,
//       child: Container(
//         height: 100,
//         width: 400,
//         padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//         decoration: BoxDecoration(
//           color: Color(0xFFFFFFFF),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: FutureBuilder<List<UserTicket>>(
//           future: futureData,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               List<UserTicket>? data = snapshot.data;
//               return ListView.builder(
//                 itemCount: data!.length,
//                 itemBuilder: (context, index) {
//                   var str = data[index].createdAt.toString();
//                   var parts = str.split(' ');
//                   var createdDate = parts[0].trim();
//                   print(' previous:$str');
//                   print(createdDate);
//                   return Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       // Text(
//                       //   data[index].status,
//                       //   // data![index].id, //'Ticket No-1947034',
//                       //   style: TextStyle(
//                       //     fontSize: 14,
//                       //     fontWeight: FontWeight.w500,
//                       //     color: blackColor,
//                       //   ),
//                       // ),

//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             data[index].id, //'Ticket No-1947034',
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                               color: blackColor,
//                             ),
//                           ),
//                           Text(
//                             createdDate,
//                             // '05-12-2020',
//                             style: TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w600,
//                               color: greyColor,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 8,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Tracking number:n\IW3475453455',
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w400,
//                               color: greyColor,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             padding: EdgeInsets.symmetric(
//                                 vertical: 5, horizontal: 10),
//                             decoration: BoxDecoration(
//                               color: primaryColor,
//                               borderRadius: BorderRadius.circular(3),
//                             ),
//                             child: InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   isExpanded = !isExpanded;
//                                 });
//                               },
//                               child: Text(
//                                 // data[index].description,
//                                 'description',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w600,
//                                   color: whiteColor,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Text(
//                             data[index].status,
//                             // 'In-process',
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w400,
//                               color: greenColor,
//                             ),
//                           ),
//                         ],
//                       ),
//                       // check kr rhe hai ki agar true ha to details shw kre wrna nh kare
//                       isExpanded
//                           ? // iska mtlb hota ha true
//                           Column(
//                               children: [
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                       child: Text(
//                                         data[index].issueType,

//                                         // 'Issue raised:',
//                                         style: TextStyle(
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w400,
//                                           color: greyColor,
//                                         ),
//                                       ),
//                                     ),
//                                     Expanded(
//                                       child: Text(
//                                         '“Payment failed”',
//                                         style: TextStyle(
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w400,
//                                           color: greyColor,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 InkWell(
//                                   onTap: () {
//                                     //to show a dialog for description details
//                                     showDialog(
//                                       context: context,
//                                       builder: (ctx) => AlertDialog(
//                                         scrollable: true,
//                                         title: Row(
//                                           children: [
//                                             Text(data[index].id),
//                                             SizedBox(
//                                               width: 61,
//                                             ),
//                                             InkWell(
//                                               onTap: () {
//                                                 Navigator.pop(context);
//                                               },
//                                               child: Icon(
//                                                 Icons.close,
//                                                 color: primaryColor,
//                                                 size: 30,
//                                               ),
//                                             )
//                                           ],
//                                         ),
//                                         content: SizedBox(
//                                           height: 150,
//                                           width: 100,
//                                           child: Scrollbar(
//                                             child: ListView(
//                                               children: [
//                                                 Text(data[index].description)
//                                                 // Text(
//                                                 //   'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.',
//                                                 // ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                         actions: [
//                                           Container(
//                                             padding: EdgeInsets.symmetric(
//                                                 vertical: 10, horizontal: 10),
//                                             decoration: BoxDecoration(
//                                               color: Colors.green,
//                                               borderRadius:
//                                                   BorderRadius.circular(3),
//                                             ),
//                                             child: InkWell(
//                                               onTap: () {
//                                                 Navigator.pop(context);
//                                               },
//                                               child: Text(
//                                                 'Resubmit Issue',
//                                                 style: TextStyle(
//                                                   fontSize: 14,
//                                                   fontWeight: FontWeight.w600,
//                                                   color: whiteColor,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             width: 40,
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.symmetric(
//                                                 vertical: 10, horizontal: 10),
//                                             decoration: BoxDecoration(
//                                               color: primaryColor,
//                                               borderRadius:
//                                                   BorderRadius.circular(3),
//                                             ),
//                                             child: InkWell(
//                                               onTap: () {
//                                                 Navigator.pop(context);
//                                               },
//                                               child: Text(
//                                                 'Close the Ticket',
//                                                 style: TextStyle(
//                                                   fontSize: 14,
//                                                   fontWeight: FontWeight.w600,
//                                                   color: whiteColor,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     );
//                                   },
//                                   child: Row(
//                                     children: [
//                                       Expanded(
//                                         child: Text(
//                                           'Description:',
//                                           style: TextStyle(
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w400,
//                                             color: greyColor,
//                                           ),
//                                         ),
//                                       ),
//                                       Expanded(
//                                         child: Text(
//                                           'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. ',
//                                           softWrap: true,
//                                           maxLines: 3,
//                                           style: TextStyle(
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w400,
//                                             color: greyColor,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             )
//                           : // iska mtlb hota ha false
//                           Container()
//                     ],
//                   );
//                 },
//               );
//             } else if (snapshot.hasError) {
//               return Text("${snapshot.error}");
//             } // By default show a loading spinner.
//             return CircularProgressIndicator();
//           },
//         ),
//       ),
//     );
//   }
// }
