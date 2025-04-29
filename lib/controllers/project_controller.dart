
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProjectData {
  final String projectName;
  final String madeBy;
  final List<String> toolsUsed;
  final String githubLink;

  ProjectData({
    required this.projectName,
    required this.madeBy,
    required this.toolsUsed,
    required this.githubLink,
  });

  factory ProjectData.fromJson(Map<String, dynamic> json) {
    return ProjectData(
      projectName: json['projectName'],
      madeBy: json['madeBy'],
      toolsUsed: List<String>.from(json['toolsUsed']),
      githubLink: json['githublin'],
    );
  }
}

class ProjectController extends GetxController {
  var projects = <ProjectData>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProjects();
  }

  void fetchProjects() async {
    try {
      final response = await http.get(Uri.parse('https://website-9egw.onrender.com/api/project'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'];
        projects.value = List<ProjectData>.from(
            data.map((item) => ProjectData.fromJson(item)));
      } else {
        throw Exception('Failed to load projects');
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
