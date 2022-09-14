import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtpl/query/const.dart';
import 'package:gtpl/view/home/components/ticket.dart';

class RaiseTicketView extends StatelessWidget {
  const RaiseTicketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          // Container(
          //   child: Column(
          //     children: [
          //       SizedBox(
          //         //MediaQ ka jo kaam h size ke sth kuch bhi kr skte h jo chahiye more importance for me this mediaQ.
          //         height: MediaQuery.of(context).padding.top + 50,
          //       ),
          //       Text(
          //         'HELLO',
          //         style: TextStyle(
          //           fontSize: 20,
          //           fontWeight: FontWeight.w700,
          //           color: whiteColor,
          //         ),
          //       ),
          //       SizedBox(
          //         height: 20,
          //       ),
          //       Text(
          //         'How can we help you?',
          //         style: TextStyle(
          //           fontSize: 15,
          //           fontWeight: FontWeight.w500,
          //           color: whiteColor,
          //         ),
          //       ),
          //       SizedBox(
          //         height: 15,
          //       ),
          //     ],
          //   ),
          //   height: 200,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.only(
          //       bottomLeft: Radius.elliptical(500, 30),
          //       bottomRight: Radius.elliptical(500, 20),
          //     ),
          //     gradient: LinearGradient(
          //       colors: [
          //         Color(0xFF003A97),
          //         Color(0xFF3B80CD),
          //         Color(0xFF8CD0FD)
          //       ],
          //     ),
          //   ),
          // ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Raise a Ticket',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: blackColor,
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  decoration: InputDecoration(
                    enabled: true,
                    hintText: 'Subscriber No.',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'STB No.',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  maxLength: 250,
                  decoration: InputDecoration(
                    hintText: 'Tell Us the reason (250 words)',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(),
                  ),
                )
              ],
            ),
          ),
          Center(
            child: CupertinoButton(
              color: primaryColor,
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: whiteColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Your past tickets',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: blackColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.builder(
              padding: EdgeInsets.all(2),
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Ticket(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
