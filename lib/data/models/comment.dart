import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Comment {
  final String author;
  final String numberOfReactions;
  final String numberOfAnswers;
  final Widget picture;

  Comment({
    required this.author,
    required this.numberOfReactions,
    required this.numberOfAnswers,
    required this.picture,
  });

  Map<String, dynamic> toMap() {
    return {
      'author': author,
      'numberOfReactions': numberOfReactions,
      'numberOfAnswers': numberOfAnswers,
      'picture': picture,
    };
  }

static Comment? sessionComment;

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      author: json['author'] ?? '',
      numberOfReactions: json['numberOfReactions'] ?? '',
      numberOfAnswers: json['numberOfAnswers'] ?? '',
      picture: json['picture'] ?? '',
    );
  }

     static void saveComment(Comment comment) async{
  SharedPreferences pref  = await SharedPreferences.getInstance();
  var data = json.encode(comment.toMap());
  pref.setString("comment", data);
}

static void getComment() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  var data = pref.getString("comment");
  if(data != null){
    var decode = json.decode(data);
    var comment = Comment.fromJson(decode);
    sessionComment = comment ;
  }else{
    sessionComment = null;
  }
}

static void logOut() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.remove("comment");
  sessionComment = null ;
}


}
