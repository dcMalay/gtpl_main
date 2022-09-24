// To parse this JSON data, do
//
//     final getOperator = getOperatorFromJson(jsonString);

import 'dart:convert';

GetOperator getOperatorFromJson(String str) =>
    GetOperator.fromJson(json.decode(str));

String getOperatorToJson(GetOperator data) => json.encode(data.toJson());

class GetOperator {
  GetOperator({
    required this.status,
    required this.resultUserDetail,
    required this.getSubscriberDetail,
  });

  int status;
  ResultUserDetail resultUserDetail;
  GetSubscriberDetail getSubscriberDetail;

  factory GetOperator.fromJson(Map<String, dynamic> json) => GetOperator(
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
    required this.subscriberName,
    required this.subscriberCode,
    required this.amount,
    required this.billDate,
    required this.state,
    required this.stateCode,
  });

  Empty empty;
  DateTime dueDate;
  String returnCode;
  String returnMessage;
  String subscriberName;
  String subscriberCode;
  String amount;
  DateTime billDate;
  String state;
  String stateCode;

  factory GetSubscriberDetail.fromJson(Map<String, dynamic> json) =>
      GetSubscriberDetail(
        empty: Empty.fromJson(json["\u0024"]),
        dueDate: DateTime.parse(json["DueDate"]),
        returnCode: json["returnCode"],
        returnMessage: json["returnMessage"],
        subscriberName: json["SubscriberName"],
        subscriberCode: json["SubscriberCode"],
        amount: json["Amount"],
        billDate: DateTime.parse(json["BillDate"]),
        state: json["State"],
        stateCode: json["StateCode"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024": empty.toJson(),
        "DueDate": dueDate.toIso8601String(),
        "returnCode": returnCode,
        "returnMessage": returnMessage,
        "SubscriberName": subscriberName,
        "SubscriberCode": subscriberCode,
        "Amount": amount,
        "BillDate": billDate.toIso8601String(),
        "State": state,
        "StateCode": stateCode,
      };
}

class Empty {
  Empty({
    required this.xmlnsXsd,
    required this.xmlnsXsi,
    required this.xmlns,
  });

  String xmlnsXsd;
  String xmlnsXsi;
  String xmlns;

  factory Empty.fromJson(Map<String, dynamic> json) => Empty(
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
