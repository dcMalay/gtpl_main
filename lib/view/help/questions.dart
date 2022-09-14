import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtpl/query/const.dart';
import 'package:gtpl/view/help/raise_ticket.dart';

// ignore: must_be_immutable
class QuestionsView extends StatefulWidget {
  QuestionsView({Key? key, required this.category}) : super(key: key);
  String category;
  @override
  State<QuestionsView> createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> {
  List<Item> items = [
    Item(
        questionTitle:
            'Where Can I Find A List Of Channels Available In My Area?',
        questionAnswer:
            'Answer: You can find a complete listing of all channels offered in your area here.'),
    Item(
        questionTitle:
            'You can find a complete listing of all channels offered in your area here.',
        questionAnswer:
            'Answer: If your remote control is not working, first check and replace the batteries. If this does not solve your problem, the remote control may need to be reprogrammed. To reprogram your remote control, click here. If this does not work, call us at 033-66 000 000 to get a replacement remote.'),
    Item(
        questionTitle:
            'What Can I Do If My Remote No Longer Turns On My TV Or Adjusts Volume',
        questionAnswer:
            'Answer: The remote may need to be reprogrammed for your specific television set. If your remote is not listed, or if you need assistance, please contact Customer Service at 033-66 000 000 Set top box Remote Learning:- 1. Press and hold SET Key on the Set Top box remote control for 3 seconds, the red light indicator on the top left corner of the remote will get darker thus entering the learning mode. 2. Press the key you want to assign to the set top box remote the red light indicator will start flickering, this means the remote is now ready to learn from the other remote control (TV Remote). 3. Hold the TV remote control, aim at the Set top box remote from a distance of 3 to 5 cm, press the button you want to be replicated on the TV remote control. 4. On pressing this button, the Indicator light on the top left will flicker three times, this indicates the button has been assigned a function. 5. You can now select other keys which are to be assigned functions from the TV remote control. 6. After completion of the process, press SET key on the set top box remote control to exit learning status, this will lead to the indicator light on the top left to turn off. 7. You can now use the same remote for both your TV and Set top box. Use these steps everywhere when it talks about reprogramming of remotes. Further in areas where steps have been provided in FAQ please remove the ans on top and arrange the steps in proper layout. The information provided on the STB page at the bottom is not at all professional please provide the information in a professional way and do not use those colourful boxes. The broadband page is too wordy and the representation of the content is very boring and discourages people to go through it, please rearrange the page such that is looks neat and people click to see what they want to instead of being exposed to so much info at once .'),
    Item(
        questionTitle: 'Why Does My HDTV Say ‘Weak Or NO Signal’?',
        questionAnswer:
            'Answer: Newer HD television sets have many input options. More than likely, your TV is simply on the wrong input to receive the signal from our cable box. Make sure your GTPL KCBPL cable box is powered on, and use your TV remote to change inputs (for most HD TVs you have to choose HDMI 1 or HDMI 2 in which port you connect you STB).'),
    Item(
        questionTitle: 'What Is E-51 Error?',
        questionAnswer:
            'Answer: Post a month of subscription Set Top Box deletes the package by default. Upon renewal a new command is sent to the box which activates the package. If STB is switched off this command is not received & hence the package is not activated in spite of the command being transmitted How can consumers troubleshoot\?In case consumer does not receive picture, ensure pack is activated, keep STB switched on (around 10 mins) to receive the command & resume services or give a missed call to 033 6600 0099/033 4089 4646 from registered no.'),
  ];
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
            height: 50,
          ),
          Center(
            child: Text(
              widget.category,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: primaryColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ExpansionPanelList.radio(
              children: items
                  .map((item) => ExpansionPanelRadio(
                      value: item.questionTitle,
                      canTapOnHeader: true,
                      headerBuilder: (context, isExpanded) => ListTile(
                            title: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                item.questionTitle,
                              ),
                            ),
                          ),
                      body: Container(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          item.questionAnswer,
                          style: TextStyle(
                            color: greyColor,
                          ),
                        ),
                      )))
                  .toList(),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              'Not found Answers for your Queries?',
              style: TextStyle(
                fontSize: 16,
                color: greyColor,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: CupertinoButton(
              color: primaryColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RaiseTicketView();
                }));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Text(
                  'Raise a Ticket',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: whiteColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Item {
  final String questionTitle;
  final String questionAnswer;
  Item({
    required this.questionTitle,
    required this.questionAnswer,
  });
}
