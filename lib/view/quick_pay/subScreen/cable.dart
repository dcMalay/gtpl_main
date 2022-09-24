import 'package:flutter/material.dart';
import 'package:gtpl/const/const.dart';
import 'package:gtpl/query/const.dart';

class QuickCable extends StatelessWidget {
  const QuickCable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Subcriber Details", style: TextStyle(color: greyColor)),
          const SizedBox(
            height: 8,
          ),
          TextField(
            // controller: stbController,
            decoration: InputDecoration(
              hintText:
                  'Enter Your STB No. / Account No. / Registered Phone no.',
              hintStyle: TextStyle(color: greycolor, fontSize: 11),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          // Text("Your Curent Plan", style: TextStyle(color: greyColor)),
          // const SizedBox(
          //   height: 8,
          // ),
          // TextField(
          //   readOnly: true,
          //   // controller: stbController,
          //   decoration: InputDecoration(
          //     isDense: true,
          //     hintText: 'Your Curent Plan',
          //     hintStyle: TextStyle(color: greycolor),
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 50,
          ),

          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Continue",
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    blurRadius: 3,
                    spreadRadius: 1,
                    color: primaryColor.withOpacity(0.5))
              ], color: primaryColor, borderRadius: BorderRadius.circular(10)),
            ),
          )
          // const SizedBox(
          //   height: 10,
          // ),
          // TextField(
          //   controller: phoneController,
          //   decoration: InputDecoration(
          //     hintText: 'Enter Your phone Number',
          //     hintStyle: TextStyle(color: greycolor),
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
