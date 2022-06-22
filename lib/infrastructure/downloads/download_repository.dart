import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/api_end_point.dart';
import 'package:netflix_clone/domain/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/downloads/i_download_repo.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';

@LazySingleton(as: IDownloadRepo)
class DownloadRepository implements IDownloadRepo {
  @override
  Future<Either<MainFailures, List<Downloads>>> getDownloadsImage() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoint.download);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final downloadList = (response.data["results"] as List).map((e) {
          return Downloads.fromJson(e);
        }).toList();

        return right(downloadList);
      } else {
        return const Left(MainFailures.serverFailures());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailures.clientFailures());
    }
  }
}
