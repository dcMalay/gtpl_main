import 'package:flutter/material.dart';
import 'package:gtpl/query/const.dart';
import 'package:gtpl/query/global_handler.dart';

class ErrorPage extends StatefulWidget {
  final String message;
  final String title;
  final ds;
  const ErrorPage(
      {Key? key, required this.message, required this.title, this.ds})
      : super(key: key);

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  var listData;
  @override
  void initState() {
    listData = widget.ds as Map<String, dynamic>;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Message :",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.message,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Subscriber Detail: ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                for (var element in listData.entries)
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            element.key + ": ",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            element.value.toString(),
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Divider(),
          ListTile(
            onTap: () {
              GlobalHandler.logout(context);
            },
            leading: Container(
              height: 30,
              width: 30,
              child: Center(
                child: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
            ),
            trailing: Icon(
              size: 15,
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
            title: Text(
              'Logout',
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              'Logout from your account',
              style: TextStyle(color: greyColor),
            ),
          ),
        ],
      ),
    );
  }

  // void ds() {
  //   ok.entries.forEach((element) {
  //     print(element.key + " : " + element.value);
  //     // print();
  //   });
  // }
}
