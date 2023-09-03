import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nendoroid_db/networks/services/scraping_serivce.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'nendo_image_provider.g.dart';

part 'nendo_image_provider.freezed.dart';

@riverpod
class NendoImage extends _$NendoImage {
  @override
  FutureOr<NendoImageState> build(String gscProductNum) async {
    return fetchImage(gscProductNum);
  }

  Future<NendoImageState> fetchImage(String gscProductNum) async {
    final result = await ref.read(scrapingServiceProvider).getGoodSmileImage(gscProductNum: gscProductNum);

    return result.when(
      success: (value) {
        return NendoImageState(
          imageList: value.imageList,
          thumbnailList: value.thumbnailList,
        );
      },
      error: (error, stackTrace) {
        return Future.error(error, stackTrace);
      },
    );
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(() => fetchImage(gscProductNum));
  }
}

@freezed
class NendoImageState with _$NendoImageState {
  const factory NendoImageState({
    required List<String> imageList,
    required List<String> thumbnailList,
  }) = _NendoImageState;
}
