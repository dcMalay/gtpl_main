import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gtpl/query/global_handler.dart';

Future<GetResponsePlanListModel?> getBroadbandPlanList(
    BuildContext context, String productType) async {
  try {
    var getid = await GlobalHandler.getBroadbandNo();

    var response = await GlobalHandler.requestPost("/broadband/plan/list", {
      "user_id": getid,
      "product_type": productType,
    });
    var js = json.decode(response.body);

    GetResponsePlanListModel res = GetResponsePlanListModel.fromJson(js);
    return res;
  } catch (e) {
    GlobalHandler.snackBar(
        context: context, message: e.toString(), isError: true);
    return null;
  }
}

class GetResponsePlanListModel {
  int? status;
  List<ResultPlan>? resultPlan;

  GetResponsePlanListModel({this.status, this.resultPlan});

  GetResponsePlanListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['result_plan'] != null) {
      resultPlan = <ResultPlan>[];
      json['result_plan'].forEach((v) {
        resultPlan!.add(new ResultPlan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.resultPlan != null) {
      data['result_plan'] = this.resultPlan!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResultPlan {
  String? amount;
  String? planName;
  String? volumeQuota;
  String? validity;
  String? description;

  ResultPlan(
      {this.amount,
      this.planName,
      this.volumeQuota,
      this.validity,
      this.description});

  ResultPlan.fromJson(Map<String, dynamic> json) {
    amount = json['Amount'];
    planName = json['PlanName'];
    volumeQuota = json['VolumeQuota'];
    validity = json['Validity'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Amount'] = this.amount;
    data['PlanName'] = this.planName;
    data['VolumeQuota'] = this.volumeQuota;
    data['Validity'] = this.validity;
    data['Description'] = this.description;
    return data;
  }
}
