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
// late final user_id;

//function to getting user token
Future<Token> getToken(String user_id) async {
  final response = await http.get(Uri.parse('${baseUrl}userlogin/${user_id}'));
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
Future<ResultUserDetail> getOperator(String user_id) async {
  final response = await http.post(
    Uri.parse("${baseUrl}broadband/user/details"),
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    },
    body: jsonEncode(
      <String, String>{"user_id": user_id},
    ),
  );
  if (response.statusCode == 201) {
    print("User Id${user_id}");
    return ResultUserDetail.fromJson(json.decode(response.body));
  } else {
    throw Exception('data loading failed!');
  }
}

//function to post ticket issue for broadband

Future<UserTicket> postTicket(
  String user_id,
  String description,
  String issue_type,
  String operator_id,
) async {
  var authToken = await _secureStorage.read(key: 'token');

  dio.options.headers['content-Type'] = 'application/json';
  dio.options.headers["authorization"] = "token ${authToken}";
  dio.post("${baseUrl}newTicket", data: {
    "user_id": user_id,
    "description": description,
    "issue_type": issue_type,
    "operator_id": operator_id,
  });
  final http.Response response = await http.post(
    Uri.parse("${baseUrl}newTicket"),
    headers: {
      HttpHeaders.authorizationHeader: authToken!,
      HttpHeaders.contentTypeHeader: 'application/json'
    },
    body: jsonEncode(
      <String, String>{
        "user_id": user_id,
        "description": description,
        "issue_type": issue_type,
        "operator_id": operator_id,
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
  print('user ----> ${authUser}');
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
