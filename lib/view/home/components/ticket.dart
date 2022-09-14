import 'package:flutter/material.dart';
import 'package:gtpl/query/const.dart';

class Ticket extends StatefulWidget {
  const Ticket({Key? key}) : super(key: key);

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  // ye ek variable bool jsime hum true or false kr rha ehai ha ya na 
  var isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      // main yaha 10 islye diya mujhe upar ka bhi shape lana tha wahi ni hora mujhse.abhi 10.30 hora tym.
      // 1 elevation add hua h
      elevation: 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ticket No-1947034',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: blackColor,
                  ),
                ),
                Text(
                  '05-12-2020',
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
                    vertical:5 ,
                    horizontal: 10
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Text(
                      'View Details',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
                Text(
                  'In-process',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: greenColor,
                  ),
                ),
              ],
            ),
            // check kr rhe hai ki agar true ha to details shw kre wrna nh kare 
            isExpanded ? // iska mtlb hota ha true 
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
                        '“Payment failed”',
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
                Row(
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
                        'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: greyColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ) : // iska mtlb hota ha false
             Container()
          ],
        ),
      ),
    );
  }
}
