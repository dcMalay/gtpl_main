import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gtpl/query/global_handler.dart';

Future<GetBroadbandDetailsModel?> getBroadbandUserDetails(
    BuildContext context, String userid) async {
  // try {
  var response = await GlobalHandler.requestPost(
      "/broadband/user/details", {"user_id": userid});
  var js = json.decode(response.body);
  print(js);
  print(js['status']);
  if (js['status'] == 200) {
    var res = GetBroadbandDetailsModel.fromJson(js);
    //print("data from broad band user details -->$res");
    return res;
  }
  if (js['get_subscriber_detail']['returnCode'] != "0") {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(js['get_subscriber_detail']['returnMessage']),
    ));
    var res = GetBroadbandDetailsModel2.fromJson(js);
    print("data from broad band user details when -->$res");
  } else if (js['status'] != 200) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(js['responseInfo']['returnMessage']),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  } else {
    print("getting error");
  }
  var res = GetBroadbandDetailsModel.fromJson(js);
  return res;
  // if (js['get_subscriber_detail']['returnCode'] != "0") {
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: Text(js['get_subscriber_detail']['returnMessage']),
  //   ));

  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
  //     return ErrorPage(
  //       ds: js['result_user_detail'],
  //       title: "Error Code " + js['get_subscriber_detail']['returnCode'],
  //       message: js['get_subscriber_detail']['returnMessage'],
  //     );
  //   }));
  // }

  // } catch (e) {
  //   GlobalHandler.snackBar(
  //       context: context, message: e.toString(), isError: true);
  //   return null;
  // }
}

class GetBroadbandDetailsModel2 {
  int? status;
  String? message;
  ResultUserDetail2? resultUserDetail;
  GetSubscriberDetail2? getSubscriberDetail;

  GetBroadbandDetailsModel2(
      {this.status, this.resultUserDetail, this.getSubscriberDetail});

  GetBroadbandDetailsModel2.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    resultUserDetail = json['result_user_detail'] != null
        ? ResultUserDetail2.fromJson(json['result_user_detail'])
        : null;
    getSubscriberDetail = json['get_subscriber_detail'] != null
        ? GetSubscriberDetail2.fromJson(json['get_subscriber_detail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (resultUserDetail != null) {
      data['result_user_detail'] = resultUserDetail!.toJson();
    }
    if (getSubscriberDetail != null) {
      data['get_subscriber_detail'] = getSubscriberDetail!.toJson();
    }
    return data;
  }
}

class ResultUserDetail2 {
  String? status;
  String? expiryDate;
  String? returnCode;
  String? returnMessage;
  String? name;
  String? userId;
  String? address;
  String? area;
  String? city;
  String? state;
  String? nation;
  String? mobileNo;
  String? telephone;
  String? eMail;
  String? currentPlanName;
  String? partnerCode;
  String? outstandingAmount;

  ResultUserDetail2(
      {this.status,
      this.expiryDate,
      this.returnCode,
      this.returnMessage,
      this.name,
      this.userId,
      this.address,
      this.area,
      this.city,
      this.state,
      this.nation,
      this.mobileNo,
      this.telephone,
      this.eMail,
      this.currentPlanName,
      this.partnerCode,
      this.outstandingAmount});

  ResultUserDetail2.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    expiryDate = json['ExpiryDate'];
    returnCode = json['returnCode'];
    returnMessage = json['returnMessage'];
    name = json['Name'];
    userId = json['UserId'];
    address = json['Address'];
    area = json['Area'];
    city = json['City'];
    state = json['State'];
    nation = json['Nation'];
    mobileNo = json['MobileNo'];
    telephone = json['Telephone'];
    eMail = json['EMail'];
    currentPlanName = json['CurrentPlanName'];
    partnerCode = json['PartnerCode'];
    outstandingAmount = json['OutstandingAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Status'] = status;
    data['ExpiryDate'] = expiryDate;
    data['returnCode'] = returnCode;
    data['returnMessage'] = returnMessage;
    data['Name'] = name;
    data['UserId'] = userId;
    data['Address'] = address;
    data['Area'] = area;
    data['City'] = city;
    data['State'] = state;
    data['Nation'] = nation;
    data['MobileNo'] = mobileNo;
    data['Telephone'] = telephone;
    data['EMail'] = eMail;
    data['CurrentPlanName'] = currentPlanName;
    data['PartnerCode'] = partnerCode;
    data['OutstandingAmount'] = outstandingAmount;
    return data;
  }
}

class GetSubscriberDetail2 {
  String? dueDate;
  String? returnCode;
  String? returnMessage;
  String? subscriberName;
  String? subscriberCode;
  String? amount;
  String? billDate;

  GetSubscriberDetail2(
      {this.dueDate,
      this.returnCode,
      this.returnMessage,
      this.subscriberName,
      this.subscriberCode,
      this.amount,
      this.billDate});

  GetSubscriberDetail2.fromJson(Map<String, dynamic> json) {
    // dueDate = json['DueDate'];
    returnCode = json['returnCode'];
    returnMessage = json['returnMessage'];
    subscriberName = json['SubscriberName'];
    subscriberCode = json['SubscriberCode'];
    amount = json['Amount'];
    // billDate = json['BillDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['DueDate'] = dueDate;
    data['returnCode'] = returnCode;
    data['returnMessage'] = returnMessage;
    data['SubscriberName'] = subscriberName;
    data['SubscriberCode'] = subscriberCode;
    data['Amount'] = amount;
    data['BillDate'] = billDate;
    return data;
  }
}

class GetBroadbandDetailsModel {
  int? status;
  String? message;
  ResultUserDetail? resultUserDetail;
  GetSubscriberDetail? getSubscriberDetail;

  GetBroadbandDetailsModel(
      {this.status, this.resultUserDetail, this.getSubscriberDetail});

  GetBroadbandDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    resultUserDetail = json['result_user_detail'] != null
        ? ResultUserDetail.fromJson(json['result_user_detail'])
        : null;
    getSubscriberDetail = json['get_subscriber_detail'] != null
        ? GetSubscriberDetail.fromJson(json['get_subscriber_detail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (resultUserDetail != null) {
      data['result_user_detail'] = resultUserDetail!.toJson();
    }
    if (getSubscriberDetail != null) {
      data['get_subscriber_detail'] = getSubscriberDetail!.toJson();
    }
    return data;
  }
}

class ResultUserDetail {
  String? status;
  String? expiryDate;
  String? returnCode;
  String? returnMessage;
  String? name;
  String? userId;
  String? address;
  String? area;
  String? city;
  String? state;
  String? nation;
  String? mobileNo;
  String? telephone;
  String? eMail;
  String? currentPlanName;
  String? partnerCode;
  String? outstandingAmount;

  ResultUserDetail(
      {this.status,
      this.expiryDate,
      this.returnCode,
      this.returnMessage,
      this.name,
      this.userId,
      this.address,
      this.area,
      this.city,
      this.state,
      this.nation,
      this.mobileNo,
      this.telephone,
      this.eMail,
      this.currentPlanName,
      this.partnerCode,
      this.outstandingAmount});

  ResultUserDetail.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    expiryDate = json['ExpiryDate'];
    returnCode = json['returnCode'];
    returnMessage = json['returnMessage'];
    name = json['Name'];
    userId = json['UserId'];
    address = json['Address'];
    area = json['Area'];
    city = json['City'];
    state = json['State'];
    nation = json['Nation'];
    mobileNo = json['MobileNo'];
    telephone = json['Telephone'];
    eMail = json['EMail'];
    currentPlanName = json['CurrentPlanName'];
    partnerCode = json['PartnerCode'];
    outstandingAmount = json['OutstandingAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Status'] = status;
    data['ExpiryDate'] = expiryDate;
    data['returnCode'] = returnCode;
    data['returnMessage'] = returnMessage;
    data['Name'] = name;
    data['UserId'] = userId;
    data['Address'] = address;
    data['Area'] = area;
    data['City'] = city;
    data['State'] = state;
    data['Nation'] = nation;
    data['MobileNo'] = mobileNo;
    data['Telephone'] = telephone;
    data['EMail'] = eMail;
    data['CurrentPlanName'] = currentPlanName;
    data['PartnerCode'] = partnerCode;
    data['OutstandingAmount'] = outstandingAmount;
    return data;
  }
}

class GetSubscriberDetail {
  String? dueDate;
  String? returnCode;
  String? returnMessage;
  String? subscriberName;
  String? subscriberCode;
  String? amount;
  String? billDate;

  GetSubscriberDetail(
      {this.dueDate,
      this.returnCode,
      this.returnMessage,
      this.subscriberName,
      this.subscriberCode,
      this.amount,
      this.billDate});

  GetSubscriberDetail.fromJson(Map<String, dynamic> json) {
    dueDate = json['DueDate'];
    returnCode = json['returnCode'];
    returnMessage = json['returnMessage'];
    subscriberName = json['SubscriberName'];
    subscriberCode = json['SubscriberCode'];
    amount = json['Amount'];
    billDate = json['BillDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['DueDate'] = dueDate;
    data['returnCode'] = returnCode;
    data['returnMessage'] = returnMessage;
    data['SubscriberName'] = subscriberName;
    data['SubscriberCode'] = subscriberCode;
    data['Amount'] = amount;
    data['BillDate'] = billDate;
    return data;
  }
}
