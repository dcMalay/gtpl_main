import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:gtpl/provider/home.dart';
import 'package:gtpl/query/const.dart';
import 'package:gtpl/query/global_handler.dart';
import 'package:gtpl/view/explore/explore.dart';
import 'package:gtpl/view/help/help.dart';
import 'package:gtpl/view/home/home_screen.dart';
import 'package:gtpl/view/my_account/my_account.dart';
import 'package:gtpl/view/quick_pay/quick_pay.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, value, snapshot) {
      return Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: value.currentIndex,
          onTap: (v) {
            value.chnageScreen(v);
          },
          backgroundColor: Colors.white,
          // showUnselectedLabels: true,
          selectedItemColor: primaryColor,
          unselectedItemColor: const Color(0xffA9A9A9),
          items: [
            const ItemValue(
              index: 0,
              icon: Icon(Feather.home),
              label: "Home",
            ),
            const ItemValue(
              index: 1,
              icon: Icon(MaterialIcons.support_agent),
              label: "help",
            ),
            ItemValue(
                index: 4,
                icon: InkWell(
                  onTap: () {
                    GlobalHandler.navigatorPush(context, const QuickPay());
                  },
                  child: CircleAvatar(
                    // backgroundColor: Colors.red,
                    backgroundColor: primaryColor,
                    // backgroundColor: Colors.red,
                    child: Icon(
                      FontAwesome.rupee,
                      color: Colors.white,
                    ),
                  ),
                )),
            const ItemValue(
                index: 2, icon: Icon(MaterialIcons.explore), label: "Explore"),

            const ItemValue(
              index: 3,
              icon: Icon(MaterialCommunityIcons.account_outline),
              label: "My Account",
            ),
            // BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          ],
        ),
        body: value.currentIndex == 3
            ? const MyAccount()
            : value.currentIndex == 2
                ? const Explore()
                : value.currentIndex == 1
                    ? Help()
                    : const HomeScreen(),
      );
    });
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int)? onTap;
  final Color? backgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final List<ItemValue> items;
  const CustomBottomNavigationBar(
      {Key? key,
      required this.currentIndex,
      this.onTap,
      this.backgroundColor,
      this.selectedItemColor,
      this.unselectedItemColor,
      required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        decoration:
            BoxDecoration(color: backgroundColor ?? Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 3,
          ),
        ]),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        // color: backgroundColor ?? Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.map((v) {
            return Expanded(
              child: InkWell(
                onTap: () {
                  onTap?.call(v.index);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    IconTheme(
                        data: IconThemeData(
                            color: currentIndex == v.index
                                ? selectedItemColor ?? primaryColor
                                : unselectedItemColor ??
                                    const Color(0xffA9A9A9)),
                        child: v.icon),
                    const SizedBox(
                      height: 5,
                    ),
                    v.label == null
                        ? Container()
                        : Text(
                            v.label!,
                            style: TextStyle(
                                fontSize: 12,
                                color: v.index == currentIndex
                                    ? selectedItemColor
                                    : unselectedItemColor!),
                          ),
                  ],
                ),
              ),
            );
          }).toList(),
        ));
  }
}

class ItemValue {
  final int index;
  final Widget icon;
  final String? label;
  const ItemValue({required this.index, required this.icon, this.label});
}
