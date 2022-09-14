import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gtpl/query/global_handler.dart';

Future<GetResponseOTPModel?> sentOtp(BuildContext context, String stbno) async {
  try {
    var response = await GlobalHandler.requestPost(
        "/cable/user/stb/details", {"stbNo": stbno});
    var js = json.decode(response.body);

    GetResponseOTPModel res = GetResponseOTPModel.fromJson(js);
    return res;
  } catch (e) {
    GlobalHandler.snackBar(
        context: context, message: e.toString(), isError: true);
    return null;
  }
}

class GetResponseOTPModel {
  int? status;
  int? otp;
  String? module;
  String? cUSTOMERNO;

  GetResponseOTPModel({this.status, this.otp, this.module, this.cUSTOMERNO});

  GetResponseOTPModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    otp = json['otp'];
    module = json['module'];
    cUSTOMERNO = json['CUSTOMERNO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['otp'] = otp;
    data['module'] = module;
    data['CUSTOMERNO'] = cUSTOMERNO;
    return data;
  }
}
