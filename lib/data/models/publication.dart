import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:woo/data/models/comment.dart';

class Publication {
  final String author;
  final Widget type;
  final String root;
  final Comment comment;
  final String reaction;
  final String duration;

  Publication({
    required this.author,
    required this.type,
    required this.root,
    required this.comment,
    required this.reaction,
    required this.duration,
  });

  Map<String, dynamic> toMap() {
    return {
      'author': author,
      'type': type,
      'root': root,
      'comment': comment,
      'reaction': reaction,
      'duration': duration,
    };
  }

static Publication? sessionPublication;

  factory Publication.fromJson(Map<String, dynamic> json) {
    return Publication(
      author: json['author'] ?? '',
      type: json['type'] ?? '',
      root: json['root'] ?? '',
      comment: json['comment'] ?? '',
      reaction: json['reaction'] ?? '',
      duration: json['duration'] ?? '',
    );
  }

  static void savePublication(Publication publication) async{
  SharedPreferences pref  = await SharedPreferences.getInstance();
  var data = json.encode(publication.toMap());
  pref.setString("publication", data);
}

static void getPublication() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  var data = pref.getString("publication");
  if(data != null){
    var decode = json.decode(data);
    var publication = Publication.fromJson(decode);
    sessionPublication = publication ;
  }else{
    sessionPublication = null;
  }
}

static void logOut() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.remove("publication");
  sessionPublication = null ;
}
}
