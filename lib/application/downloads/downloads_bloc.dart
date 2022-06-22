import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix_clone/domain/core/failures/main_failures.dart';
import 'package:netflix_clone/domain/downloads/i_download_repo.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';

part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadEvent, DownloadState> {
  final IDownloadRepo _downloadRepo;
  DownloadsBloc(this._downloadRepo) : super(DownloadState.initial()) {
    on<_GetDownloadsImage>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        downloadFailureOrSuccessOption: none(),
      ));
      final Either<MainFailures, List<Downloads>> downloadOption =
          await _downloadRepo.getDownloadsImage();
      log(downloadOption.toString());
      emit(downloadOption.fold(
        (failure) => state.copyWith(
          isLoading: false,
          downloadFailureOrSuccessOption: some(
            left(failure),
          ),
        ),
        (success) => state.copyWith(
          isLoading: false,
          downloads: success,
          downloadFailureOrSuccessOption: some(
            right(success),
          ),
        ),
      ));
    });
  }
}
