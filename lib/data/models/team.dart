import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Team {
  final String admin;
  final String numberOfPeople;
  final Widget icon;

  Team({
    required this.admin,
    required this.numberOfPeople,
    required this.icon,
  });

  Map<String, dynamic> toMap() {
    return {
      'admin': admin,
      'numberOfPeople': numberOfPeople,
      'icon': icon,
    };
  }
static Team? sessionTeam;

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      admin: json['admin'] ?? '',
      numberOfPeople: json['numberOfPeople'] ?? '',
      icon: json['icon'] ?? '',
    );
  }

static void saveTeam(Team team) async{
  SharedPreferences pref  = await SharedPreferences.getInstance();
  var data = json.encode(team.toMap());
  pref.setString("team", data);
}

static void getTeam() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  var data = pref.getString("team");
  if(data != null){
    var decode = json.decode(data);
    var team = Team.fromJson(decode);
    sessionTeam = team ;
  }else{
    sessionTeam = null;
  }
}

static void logOut() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.remove("team");
  sessionTeam = null ;
}

}

