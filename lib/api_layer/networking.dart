import 'dart:convert';
import 'dart:io';

import 'package:gtpl/api_layer/models/get_operator_model.dart';
import 'package:gtpl/api_layer/models/ticket_model.dart';
import 'package:http/http.dart' as http;

final baseUrl = 'http://3.111.229.113:3000/';
final authenticationToken =
    'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidXNlcl8xMjM0NSIsImlhdCI6MTY2MzgyODk5MX0.tsKz-8tmntn3km0s2pr4USKOEZg_dvBiBq6Ik-QCoq4';

//function to check if the user is a registered user or not
// Future<List<BroadBandUser>> fetchuserData() async {
//   final response = await http.get(
//     headers: {
//       HttpHeaders.contentTypeHeader: 'application/json',
//     },
//     Uri.parse("${baseUrl}broadband/user/details"),
//   );
//   if (response.statusCode == 200) {
//     List jsonResponse = json.decode(response.body);
//     return jsonResponse.map((data) => BroadBandUser.fromJson(data)).toList();
//   } else {
//     throw Exception('Unexpected error occured!');
//   }
// }

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
  final http.Response response = await http.post(
    Uri.parse("${baseUrl}newTicket"),
    headers: {
      HttpHeaders.authorizationHeader: authenticationToken,
      HttpHeaders.contentTypeHeader: 'application/json'
    },
    body: jsonEncode(
      <String, String>{
        "user_id": user_id,
        "description": description,
        "issue_type": issue_type,
        "operator_id": operator_id
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
  final response = await http.get(
    Uri.parse('${baseUrl}ticket/user_12345'),
    headers: {
      HttpHeaders.authorizationHeader: authenticationToken,
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
