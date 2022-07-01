import 'package:netflix_clone/core/string.dart';
import 'package:netflix_clone/infrastructure/api_key.dart';

class ApiEndPoint {
  static const download = "$kBaseUrl/trending/all/day?api_key=$apiKey";
  static const search = "$kBaseUrl/search/movie?api_key=$apiKey";
}
