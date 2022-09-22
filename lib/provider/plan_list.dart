import 'package:flutter/cupertino.dart';

import '../query/broadband/get_plan_list.dart';

class PlanListProvider extends ChangeNotifier {
  String productYype = "0";
  bool? resultFound;
  List<CustomResultPlan> result = [];
  List<CustomResultPlan> finalResult = [];
  void onChanged(String value) {
    productYype = value;
    notifyListeners();
  }

  getNull() {
    resultFound = null;
    result.clear();
  }

  getPlanList(BuildContext context) {
    getBroadbandPlanList(context, productYype).then((value) {
      if (value!.status == 200) {
        resultFound = true;

        Future.forEach(value.resultPlan!, (ResultPlan element) {
          result.add(CustomResultPlan(
              amount: element.amount,
              description: element.description,
              planName: element.planName,
              validity: element.validity,
              volumeQuota: element.volumeQuota));
        }).then((value) {
          serachData("");
        });
      } else {
        resultFound = false;
      }
    });
  }

  serachData(String value) {
    finalResult.clear();
    for (var element in result) {
      if (element.planName!.toLowerCase().contains(value.toLowerCase())) {
        finalResult.add(element);
      }
    }
    notifyListeners();
  }
}

class CustomResultPlan {
  String? amount;
  String? planName;
  String? volumeQuota;
  String? validity;
  String? description;

  CustomResultPlan(
      {this.amount,
      this.planName,
      this.volumeQuota,
      this.validity,
      this.description});

  CustomResultPlan.fromJson(Map<String, dynamic> json) {
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
