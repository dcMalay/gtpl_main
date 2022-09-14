import 'package:flutter/material.dart';
import 'package:gtpl/query/const.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  var filterList = [
    "All Plan",
    "Current Plan",
    "Add on Base",
  ];

  var selectedFilter = [];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: greyColor,
                  child: Icon(
                    Icons.close,
                    color: whiteColor,
                    size: 12,
                  ),
                ),
              ),
            ),
          ),
          ListView.builder(
            padding: EdgeInsets.all(15),
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: filterList.length,
            itemBuilder: (context, index) {
              var ds = filterList[index];
              return Card(
                elevation: 0.1,
                margin: EdgeInsets.only(bottom: 10),
                child: CheckboxListTile(
                    title: Text(ds),
                    value: selectedFilter.contains(ds),
                    onChanged: (value) {
                      if (value!) {
                        setState(() {
                          selectedFilter.add(ds);
                        });
                      } else {
                        setState(() {
                          selectedFilter.remove(ds);
                        });
                      }
                    }),
              );
            },
          ),
          SizedBox(height: 8),
          Container(
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: primaryColor,
            ),
            width: double.infinity,
            height: 50,
            child: Center(
              child: Text("Apply",
                  style: TextStyle(
                      fontSize: 18,
                      color: whiteColor,
                      fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }
}
