import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gtpl/query/global_handler.dart';

Future<Map<String?, dynamic>?> getPaymentDetails(
    BuildContext context, String token) async {
  try {
    var response = await GlobalHandler.requestGet(
      "/" + token,
    );
    var js = json.decode(response.body);

    return js;
  } catch (e) {
    GlobalHandler.snackBar(
        context: context, message: e.toString(), isError: true);
    return null;
  }
}
