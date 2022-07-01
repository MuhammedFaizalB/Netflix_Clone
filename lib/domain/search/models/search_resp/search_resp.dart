import 'package:json_annotation/json_annotation.dart';
import 'package:netflix_clone/core/constants.dart';

part 'search_resp.g.dart';

@JsonSerializable()
class SearchResp {
  @JsonKey(name: 'results')
  List<SearchResultsData> results;

  SearchResp({this.results = const []});

  factory SearchResp.fromJson(Map<String, dynamic> json) {
    return _$SearchRespFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchRespToJson(this);
}

@JsonSerializable()
class SearchResultsData {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  @JsonKey(name: 'poster_path')
  String? posterPath;

  String get posterImageUrl => '$imageAppendUrl$posterPath';

  SearchResultsData({
    this.id,
    this.originalTitle,
    this.posterPath,
  });
  factory SearchResultsData.fromJson(Map<String, dynamic> json) {
    return _$SearchResultsDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResultsDataToJson(this);
}
