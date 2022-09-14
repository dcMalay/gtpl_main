import 'package:flutter/material.dart';
import 'package:gtpl/query/const.dart';
import 'package:gtpl/view/help/choose_issue.dart';
import 'package:gtpl/view/help/questions.dart';
import 'package:gtpl/view/help/raise_ticket.dart';

enum WidgetMarker { issue, raiseTicket, questions }

// ignore: must_be_immutable
class Help extends StatefulWidget {
  Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  WidgetMarker selectedWidgetMarker = WidgetMarker.issue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(0),
        children: [
          Container(
            child: Column(
              children: [
                SizedBox(
                  //MediaQ ka jo kaam h size ke sth kuch bhi kr skte h jo chahiye more importance for me this mediaQ.
                  height: MediaQuery.of(context).padding.top + 50,
                ),
                Text(
                  'HELLO',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: whiteColor,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'How can we help you?',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: whiteColor,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: 50),
                //   padding: EdgeInsets.all(12),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(12),
                //     color: whiteColor,
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         'Tell us your issue',
                //         style: TextStyle(
                //           fontSize: 18,
                //           fontWeight: FontWeight.w500,
                //           color: greyColor,
                //         ),
                //       ),
                //       Icon(
                //         Icons.send,
                //         color: primaryColor,
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(500, 30),
                bottomRight: Radius.elliptical(500, 20),
              ),
              gradient: LinearGradient(
                colors: [
                  Color(0xFF003A97),
                  Color(0xFF3B80CD),
                  Color(0xFF8CD0FD)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: _buildCustomContainer(),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomContainer() {
    switch (selectedWidgetMarker) {
      case WidgetMarker.issue:
        return ChooseIssue();
      case WidgetMarker.questions:
        return QuestionsView(
          category: 'Cables',
        );
      case WidgetMarker.raiseTicket:
        return RaiseTicketView();
    }
  }








  
}
