import 'package:latianresponsi/model/user_model.dart';

import 'base_network.dart';

class GithubDataSource {
  static GithubDataSource instance = GithubDataSource();
  Future<Map<String, dynamic>> loadUsers() {
    return BaseNetwork.get("users");
  }
  Future<List<UsersModel>> loadUsersList() {
    return BaseNetwork.getRepos("users");
  }
  Future<Map<String, dynamic>> loadUrls(newsName,tagline) {
    return BaseNetwork.get("https://api-berita-indonesia.vercel.app/${newsName}/$tagline");
  }
  Future<Map<String, dynamic>> loadNewsDetail(urlAPI) {
    return BaseNetwork.get("${urlAPI}");
  }

}