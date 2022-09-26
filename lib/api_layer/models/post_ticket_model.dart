// To parse this JSON data, do
//
//     final postTicket = postTicketFromJson(jsonString);

import 'dart:convert';

PostTicket postTicketFromJson(String str) =>
    PostTicket.fromJson(json.decode(str));

String postTicketToJson(PostTicket data) => json.encode(data.toJson());

class PostTicket {
  PostTicket({
    required this.userId,
    required this.oparetorId,
    required this.issueType,
    required this.description,
  });

  String userId;
  String oparetorId;
  String issueType;
  String description;

  factory PostTicket.fromJson(Map<String, dynamic> json) => PostTicket(
        userId: json["user_id"],
        oparetorId: json["oparetor_id"],
        issueType: json["issue_type"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "oparetor_id": oparetorId,
        "issue_type": issueType,
        "description": description,
      };
}
