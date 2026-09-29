import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Notification {
  final Widget picture;
  final Widget intitule;
  final String durree;

  Notification({
    required this.picture,
    required this.intitule,
    required this.durree,
  });

  Map<String, dynamic> toMap() {
    return {
      'picture': picture,
      'intitule': intitule,
      'durree': durree,
    };
  }

static Notification? sessionNotification;

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      picture: json['picture'] ?? '',
      intitule: json['intitule'] ?? '',
      durree: json['durree'] ?? '',
    );
  }


   static void saveNotification(Notification notification) async{
  SharedPreferences pref  = await SharedPreferences.getInstance();
  var data = json.encode(notification.toMap());
  pref.setString("notification", data);
}

static void getNotification() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  var data = pref.getString("notification");
  if(data != null){
    var decode = json.decode(data);
    var notification = Notification.fromJson(decode);
    sessionNotification = notification ;
  }else{
    sessionNotification = null;
  }
}

static void logOut() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.remove("notification");
  sessionNotification = null ;
}
}
