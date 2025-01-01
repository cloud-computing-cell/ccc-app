import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;


 var link1 = "https://quizapp-r80t.onrender.com/quizzes/category/Coding";
  var link2 = "https://quizapp-r80t.onrender.com/quizzes/category/Aptitude";
  var link3 = "https://quizapp-r80t.onrender.com/quizzes/category/Reasoning";
  var link4 = "https://quizapp-r80t.onrender.com/QuizEntry/enter";
  var link5 ="https://website-9egw.onrender.com/api/members/";


Future<List<dynamic>> getTeamDataForFourthYear() async {
  String fourthYearData = await rootBundle.loadString("assets/sampleapi/4thyr.json");
  var fourth =jsonDecode(fourthYearData);
  return fourth;
}

Future<List<dynamic>> getTeamDataForThirdYear() async {
  String thirdYearData = await rootBundle.loadString("assets/sampleapi/3rdyr.json");
  var third = jsonDecode(thirdYearData);
  return third;
}

Future<List<dynamic>> getTeamDataForSecondYear() async {
  String secondYearData = await rootBundle.loadString("assets/sampleapi/2ndyr.json");
  var sec =jsonDecode(secondYearData);
  return sec;
}



Future getallQuiz() async{


  var allcodingquiz = await http.get(Uri.parse(link1));
  var allaptitudequiz = await http.get(Uri.parse(link2));
  var allreasoningquiz = await http.get(Uri.parse(link3));

   if (allcodingquiz.statusCode == 200 &&
      allreasoningquiz.statusCode == 200 &&
      allaptitudequiz.statusCode == 200) {
    return {
      'codingquiz': jsonDecode(allcodingquiz.body),
      'aptitude': jsonDecode(allaptitudequiz.body),
      'reasoning': jsonDecode(allreasoningquiz.body),
    };

}
}

Future teamData() async{
  var team = await http.get(Uri.parse(link5));

  var dataofteam =jsonDecode(team.body);

  if (team.statusCode ==200){
    return dataofteam;
  }
}