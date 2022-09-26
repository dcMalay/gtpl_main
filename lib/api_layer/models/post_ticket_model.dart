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
    required this.description,
    required this.issueType,
    required this.oparetorId,
  });

  String userId;
  String description;
  String issueType;
  String oparetorId;

  factory PostTicket.fromJson(Map<String, dynamic> json) => PostTicket(
        userId: json["user_id"],
        description: json["description"],
        issueType: json["issue_type"],
        oparetorId: json["oparetor_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "description": description,
        "issue_type": issueType,
        "oparetor_id": oparetorId,
      };
}
