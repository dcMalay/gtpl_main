import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gtpl/query/global_handler.dart';

Future<GetResponseRenewModel?> renewPlan(
    BuildContext context, ParamsRenewModel params) async {
  try {
    var response = await GlobalHandler.requestPost(
        "/broadband/plan/renew", params.toJson());
    var js = json.decode(response.body);
    print(js);
    GetResponseRenewModel res = GetResponseRenewModel.fromJson(js);
    return res;
  } catch (e) {
    GlobalHandler.snackBar(
        context: context, message: e.toString(), isError: true);
    return null;
  }
}

class GetResponseRenewModel {
  int? status;
  ResultPlan? resultPlan;

  GetResponseRenewModel({this.status, this.resultPlan});

  GetResponseRenewModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    resultPlan = json['result_plan'] != null
        ? ResultPlan.fromJson(json['result_plan'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (resultPlan != null) {
      data['result_plan'] = resultPlan!.toJson();
    }
    return data;
  }
}

class ResultPlan {
  String? activityName;
  String? receivedAmount;
  String? userId;
  String? planName;
  String? requestNo;
  String? returnCode;
  String? returnMessage;

  ResultPlan(
      {this.activityName,
      this.receivedAmount,
      this.userId,
      this.planName,
      this.requestNo,
      this.returnCode,
      this.returnMessage});

  ResultPlan.fromJson(Map<String, dynamic> json) {
    activityName = json['ActivityName'];
    receivedAmount = json['ReceivedAmount'];
    userId = json['UserId'];
    planName = json['PlanName'];
    requestNo = json['RequestNo'];
    returnCode = json['returnCode'];
    returnMessage = json['returnMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ActivityName'] = activityName;
    data['ReceivedAmount'] = receivedAmount;
    data['UserId'] = userId;
    data['PlanName'] = planName;
    data['RequestNo'] = requestNo;
    data['returnCode'] = returnCode;
    data['returnMessage'] = returnMessage;
    return data;
  }
}

class ParamsRenewModel {
  String? userId;
  String? planName;
  String? activityName;
  String? pGTransId;
  String? amount;
  String? paymentGatewayName;
  String? description;
  String? mobileNumber;

  ParamsRenewModel({
    this.userId,
    this.planName,
    this.activityName,
    this.pGTransId,
    this.amount,
    this.paymentGatewayName,
    this.description,
    this.mobileNumber,
  });

  ParamsRenewModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    planName = json['plan_name'];
    activityName = json['activity_name'];
    pGTransId = json['PGTransId'];
    amount = json['amount'];
    paymentGatewayName = json['payment_gateway_name'];
    description = json['Description'];
    mobileNumber = json['mobile_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['plan_name'] = planName;
    data['activity_name'] = activityName;
    data['PGTransId'] = pGTransId;
    data['amount'] = amount;
    data['payment_gateway_name'] = paymentGatewayName;
    data['Description'] = description;
    data['mobile_number'] = mobileNumber;
    return data;
  }
}
