import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;


 var four = "https://website-9egw.onrender.com/api/members/4thyear";
  var three = "https://website-9egw.onrender.com/api/members/3rdyear";
  var two = "https://website-9egw.onrender.com/api/members/2ndyear";

  var team ="https://website-9egw.onrender.com/api/members/";


// Future<List<dynamic>> getTeamDataForFourthYear() async {
//   String fourthYearData = await rootBundle.loadString("assets/sampleapi/4thyr.json");
//   var fourth =jsonDecode(fourthYearData);
//   return fourth;
// }

// Future<List<dynamic>> getTeamDataForThirdYear() async {
//   String thirdYearData = await rootBundle.loadString("assets/sampleapi/3rdyr.json");
//   var third = jsonDecode(thirdYearData);
//   return third;
// }

// Future<List<dynamic>> getTeamDataForSecondYear() async {
//   String secondYearData = await rootBundle.loadString("assets/sampleapi/2ndyr.json");
//   var sec =jsonDecode(secondYearData);
//   return sec;
// }



Future getTeamDataForFourthYear() async{
  var team = await http.get(Uri.parse(four));

  var dataofteam4 =jsonDecode(team.body);

  if (team.statusCode ==200){
    return dataofteam4;
  }
}
Future getTeamDataForThirdYear() async{
  var team = await http.get(Uri.parse(three));

  var dataofteam3 =jsonDecode(team.body);

  if (team.statusCode ==200){
    return dataofteam3;
  }
}
Future getTeamDataForSecondYear() async{
  var team = await http.get(Uri.parse(two));

  var dataofteam2 =jsonDecode(team.body);

  if (team.statusCode ==200){
    return dataofteam2;
  }
}