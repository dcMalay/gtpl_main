// To parse this JSON data, do
//
//     final broadBandUser = broadBandUserFromJson(jsonString);

import 'dart:convert';

BroadBandUser broadBandUserFromJson(String str) =>
    BroadBandUser.fromJson(json.decode(str));

String broadBandUserToJson(BroadBandUser data) => json.encode(data.toJson());

class BroadBandUser {
  BroadBandUser({
    required this.status,
    required this.resultUserDetail,
    required this.getSubscriberDetail,
  });

  int status;
  ResultUserDetail resultUserDetail;
  GetSubscriberDetail getSubscriberDetail;

  factory BroadBandUser.fromJson(Map<String, dynamic> json) => BroadBandUser(
        status: json["status"],
        resultUserDetail: ResultUserDetail.fromJson(json["result_user_detail"]),
        getSubscriberDetail:
            GetSubscriberDetail.fromJson(json["get_subscriber_detail"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result_user_detail": resultUserDetail.toJson(),
        "get_subscriber_detail": getSubscriberDetail.toJson(),
      };
}

class GetSubscriberDetail {
  GetSubscriberDetail({
    required this.empty,
    required this.dueDate,
    required this.returnCode,
    required this.returnMessage,
    required this.billDate,
    required this.state,
    required this.stateCode,
  });

  GetSubscriberDetailClass empty;
  Date dueDate;
  String returnCode;
  String returnMessage;
  Date billDate;
  String state;
  String stateCode;

  factory GetSubscriberDetail.fromJson(Map<String, dynamic> json) =>
      GetSubscriberDetail(
        empty: GetSubscriberDetailClass.fromJson(json["\u0024"]),
        dueDate: Date.fromJson(json["DueDate"]),
        returnCode: json["returnCode"],
        returnMessage: json["returnMessage"],
        billDate: Date.fromJson(json["BillDate"]),
        state: json["State"],
        stateCode: json["StateCode"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024": empty.toJson(),
        "DueDate": dueDate.toJson(),
        "returnCode": returnCode,
        "returnMessage": returnMessage,
        "BillDate": billDate.toJson(),
        "State": state,
        "StateCode": stateCode,
      };
}

class Date {
  Date({
    required this.empty,
  });

  BillDate empty;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        empty: BillDate.fromJson(json["\u0024"]),
      );

  Map<String, dynamic> toJson() => {
        "\u0024": empty.toJson(),
      };
}

class BillDate {
  BillDate({
    required this.xsiNil,
  });

  String xsiNil;

  factory BillDate.fromJson(Map<String, dynamic> json) => BillDate(
        xsiNil: json["xsi:nil"],
      );

  Map<String, dynamic> toJson() => {
        "xsi:nil": xsiNil,
      };
}

class GetSubscriberDetailClass {
  GetSubscriberDetailClass({
    required this.xmlnsXsd,
    required this.xmlnsXsi,
    required this.xmlns,
  });

  String xmlnsXsd;
  String xmlnsXsi;
  String xmlns;

  factory GetSubscriberDetailClass.fromJson(Map<String, dynamic> json) =>
      GetSubscriberDetailClass(
        xmlnsXsd: json["xmlns:xsd"],
        xmlnsXsi: json["xmlns:xsi"],
        xmlns: json["xmlns"],
      );

  Map<String, dynamic> toJson() => {
        "xmlns:xsd": xmlnsXsd,
        "xmlns:xsi": xmlnsXsi,
        "xmlns": xmlns,
      };
}

class ResultUserDetail {
  ResultUserDetail({
    required this.status,
    required this.expiryDate,
    required this.returnCode,
    required this.returnMessage,
    required this.name,
    required this.userId,
    required this.address,
    required this.area,
    required this.city,
    required this.state,
    required this.nation,
    required this.mobileNo,
    required this.telephone,
    required this.eMail,
    required this.currentPlanName,
    required this.partnerCode,
    required this.outstandingAmount,
  });

  String status;
  DateTime expiryDate;
  String returnCode;
  String returnMessage;
  String name;
  String userId;
  String address;
  String area;
  String city;
  String state;
  String nation;
  String mobileNo;
  String telephone;
  String eMail;
  String currentPlanName;
  String partnerCode;
  String outstandingAmount;

  factory ResultUserDetail.fromJson(Map<String, dynamic> json) =>
      ResultUserDetail(
        status: json["Status"],
        expiryDate: DateTime.parse(json["ExpiryDate"]),
        returnCode: json["returnCode"],
        returnMessage: json["returnMessage"],
        name: json["Name"],
        userId: json["UserId"],
        address: json["Address"],
        area: json["Area"],
        city: json["City"],
        state: json["State"],
        nation: json["Nation"],
        mobileNo: json["MobileNo"],
        telephone: json["Telephone"],
        eMail: json["EMail"],
        currentPlanName: json["CurrentPlanName"],
        partnerCode: json["PartnerCode"],
        outstandingAmount: json["OutstandingAmount"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "ExpiryDate": expiryDate.toIso8601String(),
        "returnCode": returnCode,
        "returnMessage": returnMessage,
        "Name": name,
        "UserId": userId,
        "Address": address,
        "Area": area,
        "City": city,
        "State": state,
        "Nation": nation,
        "MobileNo": mobileNo,
        "Telephone": telephone,
        "EMail": eMail,
        "CurrentPlanName": currentPlanName,
        "PartnerCode": partnerCode,
        "OutstandingAmount": outstandingAmount,
      };
}
