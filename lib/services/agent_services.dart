import 'package:dio/dio.dart';
import 'package:valornt/models/agent_model.dart';

class AgentsApi {
  final Dio dio = Dio();

  Future<List<AgentData>> getAgents() async {
    Response response = await dio.get('https://valorant-api.com/v1/agents');
    Map<String, dynamic> json = response.data;
    List<dynamic> articlesData = json['data'];
    List<AgentData> agents = [];

    for(var article in articlesData) {
      agents.add(AgentData.fromJson(article));
    }

    return agents;
  }
}