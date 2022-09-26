import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gtpl/api_layer/models/get_operator_model.dart';
import 'package:gtpl/api_layer/models/ticket_model.dart';
import 'package:gtpl/api_layer/models/token_model.dart';
import 'package:http/http.dart' as http;

final baseUrl = 'http://3.111.229.113:3000/';

final _secureStorage = FlutterSecureStorage();
Dio dio = Dio();

//function to getting user token
Future<Token> getToken() async {
  var authUser = await _secureStorage.read(key: 'user');
  print("user from gettoken---->${authUser}");
  final response = await http.get(Uri.parse('${baseUrl}userlogin/${authUser}'));
  var jsonResponse = json.decode(response.body);
  await _secureStorage.write(key: "token", value: jsonResponse['token']);
  if (response == 200) {
    Map<String, dynamic> jsonResponse = json.decode(response.body);
    return Token.fromJson(jsonResponse);
  } else {
    throw Exception("Don't get any token ");
  }
}

//function to get operator_id
Future<ResultUserDetail> getOperator() async {
  var authUser = await _secureStorage.read(key: 'user');
  print("user from getoperator---->${authUser}");

  final response = await http.post(
    Uri.parse("${baseUrl}broadband/user/details"),
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    },
    body: jsonEncode(
      <String, String>{"user_id": authUser!},
    ),
  );

  if (response.statusCode == 200) {
    var jsonResponse = ResultUserDetail.fromJson(json.decode(response.body));
    await _secureStorage.write(
      key: "operator",
      value: jsonResponse.partnerCode,
    );
    //print('Result from getOperator---->${jsonResponse.partnerCode}');
    return jsonResponse;
  } else {
    throw Exception('data loading failed!');
  }
}

//function to post ticket issue for broadband
Future<UserTicket> postTicket(
  String description,
  String issue_type,
) async {
  var authUser = await _secureStorage.read(key: 'user');
  var authToken = await _secureStorage.read(key: 'token');
  var operatorCode = await _secureStorage.read(key: 'operator');
  print("Token from postTicket---->${authToken}");
  print("operator from postTicket---->${operatorCode}");
  print("user from postTicket---->${authUser}");
  // dio.options.headers['content-Type'] = 'application/json';
  // dio.options.headers["authorization"] = "token ${authToken}";
  // dio.post("${baseUrl}newTicket", data: {
  //   "user_id": authUser,
  //   "description": description,
  //   "issue_type": issue_type,
  //   "operator_id": operatorCode,
  // });
  final http.Response response = await http.post(
    Uri.parse("${baseUrl}newTicket"),
    headers: {
      HttpHeaders.authorizationHeader: authToken!,
      HttpHeaders.contentTypeHeader: 'application/json'
    },
    body: jsonEncode(
      <String, String>{
        "user_id": authUser!,
        "description": description,
        "issue_type": issue_type,
        "operator_id": operatorCode!,
      },
    ),
  );

  if (response.statusCode == 201) {
    return UserTicket.fromJson(json.decode(response.body));
  } else {
    throw Exception('Data loading failed!');
  }
}

//function to fetch the ticket data for a perticular user
Future<List<UserTicket>> fetchTicketData() async {
  var authUser = await _secureStorage.read(key: 'user');
  var authToken = await _secureStorage.read(key: 'token');
  // var opreator = await _secureStorage.read(key: 'operator');
  print("user from fetchTicketData---->${authUser}");
  print("token from fetchTicketData---->${authToken}");
  // print("operator from fetchTicketData---->${opreator}");
  final response = await http.get(
    Uri.parse('${baseUrl}ticket/${authUser}'),
    headers: {
      HttpHeaders.authorizationHeader: authToken!,
      HttpHeaders.contentTypeHeader: 'application/json'
    },
  );
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => UserTicket.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}
