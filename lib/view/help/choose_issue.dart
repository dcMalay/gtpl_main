import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtpl/query/const.dart';
import 'package:gtpl/view/help/questions.dart';
import 'package:gtpl/view/help/raise_ticket.dart';
import 'package:gtpl/view/home/components/ticket.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ChooseIssue extends StatefulWidget {
  const ChooseIssue({Key? key}) : super(key: key);

  @override
  State<ChooseIssue> createState() => _ChooseIssueState();
}

class _ChooseIssueState extends State<ChooseIssue> {
  int activeIndex = 0;
  final controller = CarouselController();

  void animateToSlide(int index) => controller
      .animateToPage(index); // function to move the items on clicking the dots

//the widget to show indecator dots
  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: 7,
        onDotClicked: animateToSlide,
        effect: ScrollingDotsEffect(
          dotWidth: 10,
          dotHeight: 10,
          activeDotColor: primaryColor,
          dotColor: greyColor,
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Center(
          child: Text(
            'Choose your Issue',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: blackColor,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 30,
              width: 30,
              margin: EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFF003A97),
              ),
              child: IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  controller.previousPage();
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 105,
                  width: 290,
                  child: CarouselSlider(
                      carouselController: controller,
                      options: CarouselOptions(
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        aspectRatio: 16 / 9,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.scale,
                        onPageChanged: (index, reason) =>
                            setState(() => activeIndex = index),
                      ),
                      items: [
                        GestureDetector(
                          onTap: () {
                            setState(() {});
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //       return QuestionsView(
                            //         category: 'Cables',
                            //       );
                            //     },
                            //   ),
                            // );
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 32,
                                backgroundColor:
                                    Color.fromARGB(255, 183, 218, 247),
                                child: Icon(
                                  Icons.cable_outlined,
                                  size: 40,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Cables'),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return QuestionsView(
                                    category: 'Equipments',
                                  );
                                },
                              ),
                            );
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 32,
                                  backgroundColor:
                                      Color.fromARGB(255, 183, 218, 247),
                                  child: Icon(
                                    Icons.wifi_tethering,
                                    color: Colors.black,
                                    size: 40,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Equipments'),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return QuestionsView(
                                category: 'Digital',
                              );
                            }));
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 32,
                                  backgroundColor:
                                      Color.fromARGB(255, 183, 218, 247),
                                  child: Icon(
                                    Icons.four_k_outlined,
                                    color: Colors.black,
                                    size: 40,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Digital'),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return QuestionsView(
                                category: 'HDTV',
                              );
                            }));
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 32,
                                  backgroundColor:
                                      Color.fromARGB(255, 183, 218, 247),
                                  child: Icon(
                                    Icons.hd_outlined,
                                    color: Colors.black,
                                    size: 40,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('HDTV'),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return QuestionsView(
                                category: 'Parental Control',
                              );
                            }));
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 32,
                                  backgroundColor:
                                      Color.fromARGB(255, 183, 218, 247),
                                  child: Icon(
                                    Icons.co_present_outlined,
                                    color: Colors.black,
                                    size: 40,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Parental \n Control'),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return QuestionsView(
                                category: 'Smart Featured',
                              );
                            }));
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 32,
                                  backgroundColor:
                                      Color.fromARGB(255, 183, 218, 247),
                                  child: Icon(
                                    Icons.computer_rounded,
                                    color: Colors.black,
                                    size: 40,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Smart ',
                                ),
                                Text(
                                  'Featured',
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return RaiseTicketView();
                            }));
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 32,
                                  backgroundColor:
                                      Color.fromARGB(255, 183, 218, 247),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.black,
                                    size: 45,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Others'),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 20,
                ),
                buildIndicator(),
              ],
            ),
            Container(
              height: 30,
              width: 30,
              margin: EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFF003A97),
              ),
              child: IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  controller.nextPage();
                },
                icon: Icon(
                  Icons.arrow_forward,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
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
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Check ticket status',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                // margin: EdgeInsets.symmetric(horizontal: 30),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(12),
                  color: whiteColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Enter ticket number',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: greyColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Card(
                  color: primaryColor,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Check Status',
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
                height: 15,
              ),
              Center(
                child: Container(
                  width: 200,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      'Subscriber Id: 252621',
                      style: TextStyle(
                        fontSize: 16,
                        color: primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Your past tickets',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
              ),
              ListView.builder(
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
              )
            ],
          ),
        )
      ]),
    );
  }
}
