import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:gtpl/query/const.dart';
import 'package:gtpl/query/get_broad_details.dart';
import 'package:gtpl/query/get_cable_detail.dart';
import 'package:gtpl/query/global_handler.dart';
import 'package:gtpl/view/login/login.dart';
import 'package:gtpl/view/my_account/sub_screen/manage_plan.dart';
import 'package:gtpl/view/my_account/sub_screen/my_address.dart';
import 'package:gtpl/view/my_account/sub_screen/my_devices.dart';
import 'package:provider/provider.dart';

import '../../provider/home.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  bool? accountNotFound;
  bool? accountBroadbandNotFound;
  GetUserDetailsModel? dsValue;
  GetBroadbandDetailsModel? dsBroadband;

  @override
  void initState() {
    GlobalHandler.getCustomerNo().then((value) {
      if (value != null) {
        setState(() {
          accountNotFound = true;
        });
        getUserDetails(context).then((value) {
          setState(() {
            dsValue = value;
          });
        });
      } else {
        setState(() {
          accountNotFound = false;
        });
      }
    });
    GlobalHandler.getBroadbandNo().then((value) async {
      if (value != null) {
        setState(() {
          accountBroadbandNotFound = true;
        });
        var getId = await GlobalHandler.getBroadbandNo();
        getBroadbandUserDetails(context, getId!).then((value) {
          setState(() {
            dsBroadband = value;
          });
        });
      } else {
        setState(() {
          accountBroadbandNotFound = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return accountNotFound == null || accountBroadbandNotFound == null
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : accountNotFound == false && accountBroadbandNotFound == false
            ? Scaffold(
                appBar: AppBar(
                  title: const Text(
                    'My Account',
                    style: TextStyle(color: Colors.black),
                  ),
                  backgroundColor: Colors.white,
                  elevation: 2,
                ),
                body: Center(
                    child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    width: 250,
                    height: 50,
                    child: const Center(
                      child: Text(
                        'Login Now',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )))
            : dsValue == null && dsBroadband == null
                ? const Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Scaffold(
                    body: ListView(
                      padding: const EdgeInsets.all(0),
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              'assets/Rectangle 181.png',
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  const Text(
                                    "My Account",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                  dsValue != null
                                      ? ListTile(
                                          leading: const Icon(
                                            Icons.person,
                                            color: Colors.white,
                                          ),
                                          title: Text(
                                            '${dsValue!.cableResult!.fIRSTNAME.toString()} ${dsValue!.cableResult!.mIDDLENAME.toString()} ${dsValue!.cableResult!.lASTNAME!.toString()}',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          subtitle: Text(
                                            dsValue!.cableResult!.cONTACTINFO!
                                                .mOBILEPHONE
                                                .toString(),
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )
                                      : dsBroadband != null
                                          ? ListTile(
                                              leading: const Icon(
                                                Icons.person,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                '${dsBroadband!.getSubscriberDetail!.subscriberName}',
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                              subtitle: Text(
                                                dsBroadband!
                                                    .resultUserDetail!.mobileNo
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            )
                                          : Container()
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              ListTile(
                                leading: const Icon(
                                  Fontisto.world_o,
                                  color: Colors.black,
                                ),
                                trailing: Icon(
                                  size: 15,
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                ),
                                title: const Text(
                                  'About us',
                                  style: TextStyle(color: Colors.black),
                                ),
                                subtitle: Text(
                                  'History, our goals, and T&C',
                                  style: TextStyle(color: greyColor),
                                ),
                              ),
                              const Divider(),
                              ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyDevices()));
                                },
                                leading: Icon(
                                  Fontisto.tv,
                                  color: Colors.black,
                                ),
                                trailing: Icon(
                                  size: 15,
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                ),
                                title: Text(
                                  'My Connections',
                                  style: TextStyle(color: Colors.black),
                                ),
                                subtitle: Text(
                                  'view connected devices, add new',
                                  style: TextStyle(color: greyColor),
                                ),
                              ),
                              const Divider(),
                              ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyAddresss()));
                                },
                                leading: Icon(
                                  EvilIcons.location,
                                  color: Colors.black,
                                ),
                                trailing: Icon(
                                  size: 15,
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                ),
                                title: Text(
                                  'My Addresses',
                                  style: TextStyle(color: Colors.black),
                                ),
                                subtitle: Text(
                                  'Set up home address, add/remove',
                                  style: TextStyle(color: greyColor),
                                ),
                              ),
                              Divider(),
                              ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ManagePlan()),
                                  );
                                },
                                leading: Icon(
                                  Icons.home,
                                  color: Colors.black,
                                ),
                                trailing: Icon(
                                  size: 15,
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                ),
                                title: Text(
                                  'Manage plans',
                                  style: TextStyle(color: Colors.black),
                                ),
                                subtitle: Text(
                                  'See your current plan details',
                                  style: TextStyle(color: greyColor),
                                ),
                              ),
                              Divider(),
                              ListTile(
                                leading: Icon(
                                  Feather.settings,
                                  color: Colors.black,
                                ),
                                trailing: Icon(
                                  size: 15,
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                ),
                                title: Text(
                                  'Settings',
                                  style: TextStyle(color: Colors.black),
                                ),
                                subtitle: Text(
                                  'Edit profile, notifications, password',
                                  style: TextStyle(color: greyColor),
                                ),
                              ),
                              Divider(),
                              ListTile(
                                onTap: () {
                                  GlobalHandler.logout(context);
                                },
                                leading: Icon(
                                  Icons.close,
                                  color: Colors.black,
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
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
  }
}
