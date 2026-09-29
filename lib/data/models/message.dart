import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Message {
  final String author;
  final Widget? profilePicture;
  final Widget intitule;

  Message({
    required this.author,
    this.profilePicture,
    required this.intitule,
  });

  Map<String, dynamic> toMap() {
    return {
      'author': author,
      'profilePicture': profilePicture,
      'intitule': intitule,
    };
  }

static Message? sessionMessage;

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      author: json['author'] ?? '',
      profilePicture: json['profilePicture'] ?? '',
      intitule: json['intitule'] ?? '',
    );
  }


   static void saveMessage(Message message) async{
  SharedPreferences pref  = await SharedPreferences.getInstance();
  var data = json.encode(message.toMap());
  pref.setString("message", data);
}

static void getMessage() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  var data = pref.getString("message");
  if(data != null){
    var decode = json.decode(data);
    var message = Message.fromJson(decode);
    sessionMessage = message ;
  }else{
    sessionMessage = null;
  }
}

static void logOut() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.remove("message");
  sessionMessage = null ;
}

}
